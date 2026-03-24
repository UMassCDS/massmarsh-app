import 'dart:convert';
import 'package:sqflite/sqflite.dart';

/// Seed data for form templates and organizations
class TemplateSeeds {
  /// Seed all organizations and form templates
  static Future<void> seedAll(Database db) async {
    await seedOrganizations(db);
    await seedFormTemplates(db);
    await linkTemplatesToOrgs(db);
  }

  /// Seed the two main organizations
  static Future<void> seedOrganizations(Database db) async {
    // Check if already seeded
    final existing = await db.query('organizations');
    if (existing.length >= 2) return;

    // MassMarsh organization
    await db.insert(
      'organizations',
      {
        'name': 'MassMarsh',
        'slug': 'massmarsh',
        'description':
            'Massachusetts Salt Marsh Monitoring Program - Transect-based vegetation, hydrology, and elevation monitoring',
        'contact_email': 'massmarsh@umass.edu',
        'is_active': 1,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );

    // APCC organization
    await db.insert(
      'organizations',
      {
        'name': 'APCC',
        'slug': 'apcc',
        'description':
            'Association to Preserve Cape Cod - Marker horizon observation and vegetation monitoring',
        'contact_email': 'info@apcc.org',
        'is_active': 1,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  /// Seed all form templates
  static Future<void> seedFormTemplates(Database db) async {
    // Check if already seeded
    final existing = await db.query('form_templates');
    if (existing.isNotEmpty) return;

    // MassMarsh Vegetation Survey template
    await db.insert('form_templates', {
      'template_code': 'massmarsh_vegetation',
      'template_name': 'MassMarsh Vegetation Survey',
      'description':
          'Transect-based vegetation survey with plot-level species cover, canopy height, and thatch measurements',
      'monitoring_type': 'vegetation',
      'schema_json': jsonEncode(_massMarshVegetationSchema),
      'is_active': 1,
    });

    // APCC Marker Horizon Observation template
    await db.insert('form_templates', {
      'template_code': 'apcc_marker_horizon',
      'template_name': 'APCC Marker Horizon Observation',
      'description':
          'Marker horizon observation data sheet for tracking sediment accretion and vegetation',
      'monitoring_type': 'marker_horizon',
      'schema_json': jsonEncode(_apccMarkerHorizonSchema),
      'is_active': 1,
    });
  }

  /// Link templates to organizations
  static Future<void> linkTemplatesToOrgs(Database db) async {
    // Get org IDs
    final massMarshOrg = await db.query(
      'organizations',
      where: 'slug = ?',
      whereArgs: ['massmarsh'],
    );
    final apccOrg = await db.query(
      'organizations',
      where: 'slug = ?',
      whereArgs: ['apcc'],
    );

    if (massMarshOrg.isEmpty || apccOrg.isEmpty) return;

    final massMarshOrgId = massMarshOrg.first['id'] as int;
    final apccOrgId = apccOrg.first['id'] as int;

    // Get template IDs
    final vegTemplate = await db.query(
      'form_templates',
      where: 'template_code = ?',
      whereArgs: ['massmarsh_vegetation'],
    );
    final markerTemplate = await db.query(
      'form_templates',
      where: 'template_code = ?',
      whereArgs: ['apcc_marker_horizon'],
    );

    if (vegTemplate.isEmpty || markerTemplate.isEmpty) return;

    final vegTemplateId = vegTemplate.first['id'] as int;
    final markerTemplateId = markerTemplate.first['id'] as int;

    // Link MassMarsh to vegetation template
    await db.insert(
      'org_form_templates',
      {
        'org_id': massMarshOrgId,
        'template_id': vegTemplateId,
        'is_enabled': 1,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );

    // Link APCC to marker horizon template
    await db.insert(
      'org_form_templates',
      {
        'org_id': apccOrgId,
        'template_id': markerTemplateId,
        'is_enabled': 1,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  // ===========================================================================
  // MASSMARSH VEGETATION SURVEY SCHEMA
  // ===========================================================================

  static const Map<String, dynamic> _massMarshVegetationSchema = {
    'version': '1.0',
    'sections': [
      {
        'id': 'header',
        'name': 'Survey Information',
        'type': 'header',
        'fields': [
          {
            'id': 'site',
            'label': 'Site',
            'type': 'text',
            'required': true,
            'helpText': 'Name of the monitoring site',
          },
          {
            'id': 'town',
            'label': 'Town',
            'type': 'text',
            'required': true,
          },
          {
            'id': 'state',
            'label': 'State',
            'type': 'dropdown',
            'required': true,
            'options': ['MA', 'RI', 'CT', 'NH', 'ME'],
            'defaultValue': 'MA',
          },
          {
            'id': 'date',
            'label': 'Date',
            'type': 'date',
            'required': true,
          },
          {
            'id': 'quadrat_size',
            'label': 'Quadrat Size',
            'type': 'dropdown',
            'required': true,
            'options': ['0.5m²', '1.0m²', '0.25m²'],
            'defaultValue': '0.5m²',
            'helpText': 'Size of the sampling quadrat',
          },
          {
            'id': 'field_monitors',
            'label': 'Field Monitors',
            'type': 'text',
            'required': true,
            'helpText': 'Names of crew members conducting the survey',
          },
          {
            'id': 'other_info',
            'label': 'Other Info',
            'type': 'multiline_text',
            'required': false,
            'helpText': 'Any additional information about the survey',
          },
        ],
      },
      {
        'id': 'plot_data',
        'name': 'Plot Data',
        'type': 'repeating_group',
        'minItems': 1,
        'maxItems': null,
        'fields': [
          {
            'id': 'transect',
            'label': 'Transect',
            'type': 'text',
            'required': true,
            'helpText': 'Transect identifier (e.g., T1, IP-1)',
          },
          {
            'id': 'plot',
            'label': 'Plot',
            'type': 'number',
            'required': true,
            'validation': {'min': 1},
          },
          {
            'id': 'distance_m',
            'label': 'Distance (m)',
            'type': 'decimal',
            'required': true,
            'helpText': 'Distance along transect in meters',
            'validation': {'min': 0},
          },
          {
            'id': 'habitat_type',
            'label': 'Habitat',
            'type': 'dropdown',
            'required': true,
            'options': ['High', 'Trans.', 'Low', 'Pool', 'Panne', 'UE'],
            'helpText':
                'High=High Marsh, Trans.=Transition, Low=Low Marsh, UE=Upper Edge',
          },
          {
            'id': 'bare_percent',
            'label': 'Bare %',
            'type': 'percentage',
            'required': false,
            'validation': {'min': 0, 'max': 100},
            'helpText': 'Percent bare ground cover',
          },
          {
            'id': 'dead_percent',
            'label': 'Dead %',
            'type': 'percentage',
            'required': false,
            'validation': {'min': 0, 'max': 100},
            'helpText': 'Percent dead/rooted plant cover',
          },
          {
            'id': 'wrack_percent',
            'label': 'Wrack %',
            'type': 'percentage',
            'required': false,
            'validation': {'min': 0, 'max': 100},
            'helpText': 'Percent wrack (unrooted dead material)',
          },
          {
            'id': 'species_observations',
            'label': 'Species Observations',
            'type': 'nested_repeating',
            'minItems': 0,
            'maxItems': 10,
            'nestedFields': [
              {
                'id': 'species_code',
                'label': 'Species',
                'type': 'species_lookup',
                'required': true,
                'dataSource': 'species_lookup',
              },
              {
                'id': 'cover_percent',
                'label': '% Cover',
                'type': 'percentage',
                'required': true,
                'validation': {'min': 0, 'max': 100},
              },
            ],
          },
          {
            'id': 'canopy_height_cm',
            'label': 'Canopy Height (cm)',
            'type': 'decimal',
            'required': true,
            'helpText': 'Height at which 20% of plants are taller',
            'validation': {'min': 0},
          },
          {
            'id': 'thatch_height_cm',
            'label': 'Thatch Height (cm)',
            'type': 'decimal',
            'required': false,
            'helpText': 'Height of dead vegetation layer above ground',
            'validation': {'min': 0},
          },
          {
            'id': 'notes',
            'label': 'Notes',
            'type': 'multiline_text',
            'required': false,
          },
        ],
      },
    ],
  };

  // ===========================================================================
  // APCC MARKER HORIZON OBSERVATION SCHEMA
  // ===========================================================================

  static const Map<String, dynamic> _apccMarkerHorizonSchema = {
    'version': '1.0',
    'sections': [
      {
        'id': 'header',
        'name': 'Observation Header',
        'type': 'header',
        'fields': [
          {
            'id': 'team',
            'label': 'Team (Names)',
            'type': 'text',
            'required': true,
            'helpText': 'Names of team members',
          },
          {
            'id': 'date',
            'label': 'Date',
            'type': 'date',
            'required': true,
            'format': 'MM/dd/yy',
          },
          {
            'id': 'time',
            'label': 'Time',
            'type': 'time',
            'required': true,
            'format': 'HH:mm',
          },
          {
            'id': 'gps_point',
            'label': 'GPS Point',
            'type': 'gps',
            'required': false,
          },
          {
            'id': 'site',
            'label': 'Site',
            'type': 'text',
            'required': true,
          },
          {
            'id': 'plot_id',
            'label': 'Plot ID',
            'type': 'text',
            'required': true,
          },
          {
            'id': 'photo_id',
            'label': 'Photo ID',
            'type': 'text',
            'required': false,
          },
          {
            'id': 'weather_tide',
            'label': 'Weather and Tide',
            'type': 'text',
            'required': false,
            'helpText': 'Current weather conditions and tide status',
          },
          {
            'id': 'caliper_measurement',
            'label': 'Caliper Measurement',
            'type': 'decimal',
            'required': false,
            'helpText': 'Sediment depth measurement in mm',
          },
          {
            'id': 'general_observations',
            'label': 'Observations',
            'type': 'multiline_text',
            'required': false,
            'helpText': 'General observations about the plot',
          },
        ],
      },
      {
        'id': 'species_data',
        'name': 'Species Data',
        'type': 'repeating_group',
        'minItems': 1,
        'maxItems': null,
        'fields': [
          {
            'id': 'species',
            'label': 'Species',
            'type': 'species_lookup',
            'required': true,
            'dataSource': 'species_lookup',
          },
          {
            'id': 'percent_cover',
            'label': 'Percent (%) Cover',
            'type': 'percentage',
            'required': true,
            'validation': {'min': 0, 'max': 100},
          },
          {
            'id': 'stem_heights',
            'label': 'Stem Heights',
            'type': 'text',
            'required': false,
            'helpText': 'Stem height measurements',
          },
          {
            'id': 'observations',
            'label': 'Observations',
            'type': 'multiline_text',
            'required': false,
            'helpText': 'Species-specific observations',
          },
        ],
      },
    ],
  };
}
