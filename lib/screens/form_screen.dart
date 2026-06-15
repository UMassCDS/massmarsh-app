import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../models/field_outing/field_outing.dart';
import '../providers/auth_provider.dart';
import '../providers/field_outing_provider.dart';
import '../providers/org_provider.dart';
import '../services/species_service.dart';
import '../services/protocol_service.dart';

class FormScreen extends ConsumerStatefulWidget {
  final String monitoringType;
  final int? draftId;

  const FormScreen({
    required this.monitoringType,
    this.draftId,
    super.key,
  });

  @override
  ConsumerState<FormScreen> createState() => _FormScreenState();
}

// Data class for a single species observation
class SpeciesObservation {
  String speciesCode;
  int percentageCover;

  SpeciesObservation({
    required this.speciesCode,
    required this.percentageCover,
  });
}

// Data class for a plot
class PlotData {
  String transectId;
  int plotNumber;
  String plotId;
  bool plotIdManuallySet;
  String habitatType;
  double distanceAlongTransect;
  double latitude;
  double longitude;
  double canopyHeight;
  double thatchHeight;
  double? elevation;
  String? notes;
  File? photoFile;
  String? photoPath;
  List<SpeciesObservation> species;
  String? subclass;
  String? rtkPointNumber;
  final TextEditingController latController;
  final TextEditingController lngController;
  final TextEditingController plotIdController;
  final TextEditingController rtkPointNumberController;
  final Map<String, TextEditingController> pinnedControllers;
  final Map<String, TextEditingController> extraControllers;

  PlotData({
    required this.transectId,
    required this.plotNumber,
    this.plotId = '',
    this.plotIdManuallySet = false,
    required this.habitatType,
    required this.distanceAlongTransect,
    required this.latitude,
    required this.longitude,
    required this.canopyHeight,
    required this.thatchHeight,
    this.elevation,
    this.notes,
    this.photoFile,
    this.photoPath,
    this.species = const [],
    this.subclass,
    this.rtkPointNumber,
    List<String> pinnedCodes = const ['SPALT', 'SPPAT', 'BARE', 'DEAD'],
  })  : latController = TextEditingController(text: latitude == 0 ? '' : latitude.toString()),
        lngController = TextEditingController(text: longitude == 0 ? '' : longitude.toString()),
        plotIdController = TextEditingController(text: plotId),
        rtkPointNumberController = TextEditingController(text: rtkPointNumber ?? ''),
        pinnedControllers = Map.fromEntries(
          pinnedCodes.map((code) {
            final existing = species.where((s) => s.speciesCode == code);
            final text = existing.isNotEmpty ? existing.first.percentageCover.toString() : '';
            return MapEntry(code, TextEditingController(text: text));
          }),
        ),
        extraControllers = Map.fromEntries(
          species
              .where((s) => !Set.from(pinnedCodes).contains(s.speciesCode))
              .map((s) => MapEntry(
                    s.speciesCode,
                    TextEditingController(text: s.percentageCover.toString()),
                  )),
        );

  void dispose() {
    latController.dispose();
    lngController.dispose();
    plotIdController.dispose();
    rtkPointNumberController.dispose();
    for (final c in pinnedControllers.values) {
      c.dispose();
    }
    for (final c in extraControllers.values) {
      c.dispose();
    }
  }
}

class _FormScreenState extends ConsumerState<FormScreen> {
  late final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  late final _siteNameController = TextEditingController();
  late final _otherMembersController = TextEditingController();
  late final _startTimeController = TextEditingController();
  late final _endTimeController = TextEditingController();

  // For vegetation monitoring - store multiple plots
  late List<PlotData> _plots;
  int _nextPlotNumber = 1;

  // Visibility
  String _visibility = 'public';
  String? _embargoUntil;

  // Image picker
  final ImagePicker _imagePicker = ImagePicker();

  // Hydrology fields
  late final _areaTreatmentController = TextEditingController();
  late final _wlrTypeController = TextEditingController();
  late final _serialNumberController = TextEditingController();
  late final _waypointNumberController = TextEditingController();
  late final _rtkElevationController = TextEditingController();
  late final _waterAboveBelowController = TextEditingController();
  late final _wellRimToWaterController = TextEditingController();
  late final _wellRimToMarshController = TextEditingController();

  // Elevation fields
  late final _transectIdController = TextEditingController();
  late final _pointNumberController = TextEditingController();
  late final _latitudeController = TextEditingController();
  late final _longitudeController = TextEditingController();
  late final _elevationNavd88Controller = TextEditingController();
  late final _featureTypeController = TextEditingController();

  // Habitat type options for vegetation
  static const List<String> _habitatOptions = [
    'Low Marsh',
    'High Marsh',
    'Pool',
    'Upper Edge',
    'Transition'
  ];

  // Species loaded from API/cache
  List<SpeciesItem> _allSpecies = [];

  // Active protocol definition (fetched per org)
  ProtocolDefinition? _activeProtocol;

  String _generatePlotId(String transectId, int plotNumber) {
    final parts = [transectId, plotNumber.toString()]
        .where((p) => p.isNotEmpty)
        .join('_');
    return parts;
  }

  bool _hasAnyContent() {
    if (widget.draftId != null) return true;
    if (_siteNameController.text.isNotEmpty) return true;
    if (_otherMembersController.text.isNotEmpty) return true;
    if (_startTimeController.text.isNotEmpty) return true;
    if (widget.monitoringType == 'vegetation') {
      for (final plot in _plots) {
        if (plot.transectId.isNotEmpty) return true;
        if (plot.species.isNotEmpty) return true;
        if (plot.notes?.isNotEmpty == true) return true;
      }
    } else if (widget.monitoringType == 'hydrology') {
      if (_areaTreatmentController.text.isNotEmpty) return true;
      if (_serialNumberController.text.isNotEmpty) return true;
      if (_waypointNumberController.text.isNotEmpty) return true;
      if (_rtkElevationController.text.isNotEmpty) return true;
      if (_waterAboveBelowController.text.isNotEmpty) return true;
      if (_wellRimToWaterController.text.isNotEmpty) return true;
      if (_wellRimToMarshController.text.isNotEmpty) return true;
    } else if (widget.monitoringType == 'elevation') {
      if (_transectIdController.text.isNotEmpty) return true;
      if (_pointNumberController.text.isNotEmpty) return true;
      if (_latitudeController.text.isNotEmpty) return true;
      if (_longitudeController.text.isNotEmpty) return true;
      if (_elevationNavd88Controller.text.isNotEmpty) return true;
      if (_featureTypeController.text.isNotEmpty) return true;
    }
    return false;
  }

  Future<void> _onBackPressed() async {
    if (!_hasAnyContent()) {
      Navigator.of(context).pop();
      return;
    }

    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Unsaved changes'),
        content: const Text(
            'You have unsaved changes. What would you like to do?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop('keep'),
            child: const Text('Keep editing'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop('discard'),
            child: const Text('Discard'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop('save'),
            child: const Text('Save draft'),
          ),
        ],
      ),
    );

    if (!mounted) return;
    if (result == 'save') {
      await _saveDraft(context, ref);
    } else if (result == 'discard') {
      Navigator.of(context).pop();
    }
    // 'keep' or null (tapped outside) → stay on form
  }



  @override
  void initState() {
    super.initState();
    _plots = [];
    // Load species, protocol, and default visibility after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final org = ref.read(selectedOrgProvider);
      if (org != null && mounted) {
        setState(() => _visibility = org.defaultVisibility);
        ProtocolService.instance.fetchAndCache(org.id).then((protocol) {
          if (mounted) setState(() => _activeProtocol = protocol);
        });
      }
      SpeciesService.instance.fetchAndCache().then((species) {
        if (mounted) setState(() => _allSpecies = species);
      });
    });
    if (widget.monitoringType == 'vegetation' && widget.draftId == null) {
      _plots.add(PlotData(
        transectId: '',
        plotNumber: 1,
        habitatType: '',
        distanceAlongTransect: 0,
        latitude: 0,
        longitude: 0,
        canopyHeight: 0,
        thatchHeight: 0,
        species: [],
      ));
      _nextPlotNumber = 2;
    }
    
    // Load draft data if draftId is provided
    if (widget.draftId != null) {
      _loadDraftData();
    }
  }

  Future<void> _loadDraftData() async {
    try {
      final service = ref.read(fieldOutingServiceProvider);
      final draft = await service.getDraftById(widget.draftId!);
      
      if (draft == null) return;
      
      // Load basic fields
      _siteNameController.text = draft.siteName;
      if (draft.otherMembers != null) {
        _otherMembersController.text = draft.otherMembers!;
      }
      
      // Load times if available
      if (draft.startTime != null) {
        final start = draft.startTime!;
        _startTimeController.text = '${start.hour > 12 ? start.hour - 12 : start.hour == 0 ? 12 : start.hour}:${start.minute.toString().padLeft(2, '0')} ${start.hour >= 12 ? 'PM' : 'AM'}';
      }
      if (draft.endTime != null) {
        final end = draft.endTime!;
        _endTimeController.text = '${end.hour > 12 ? end.hour - 12 : end.hour == 0 ? 12 : end.hour}:${end.minute.toString().padLeft(2, '0')} ${end.hour >= 12 ? 'PM' : 'AM'}';
      }
      
      // Load child records based on monitoring type
      final db = await ref.read(appDatabaseProvider.future);
      final database = await db.database;
      
      if (widget.monitoringType == 'vegetation') {
        final vegRecords = await database.query(
          'vegetation_records',
          where: 'outing_id = ?',
          whereArgs: [widget.draftId],
          orderBy: 'plot_number',
        );
        
        setState(() {
          _plots = vegRecords.map((record) {
            List<SpeciesObservation> species = [];
            if (record['species_observations'] != null) {
              final speciesJson = jsonDecode(record['species_observations'] as String) as List;
              species = speciesJson.map((s) => SpeciesObservation(
                speciesCode: s['species_code'] as String,
                percentageCover: s['percentage_cover'] as int,
              )).toList();
            }
            
            return PlotData(
              transectId: record['transect_id'] as String? ?? '',
              plotNumber: record['plot_number'] as int? ?? 1,
              plotId: record['plot_id'] as String? ?? '',
              plotIdManuallySet: (record['plot_id'] as String?)?.isNotEmpty ?? false,
              habitatType: record['habitat_type'] as String? ?? '',
              distanceAlongTransect: (record['distance_along_transect_m'] as num?)?.toDouble() ?? 0.0,
              latitude: (record['latitude'] as num?)?.toDouble() ?? 0.0,
              longitude: (record['longitude'] as num?)?.toDouble() ?? 0.0,
              canopyHeight: (record['canopy_height_m'] as num?)?.toDouble() ?? 0.0,
              thatchHeight: (record['thatch_height_m'] as num?)?.toDouble() ?? 0.0,
              elevation: (record['elevation_m'] as num?)?.toDouble(),
              notes: record['notes'] as String?,
              photoPath: record['photo_local_path'] as String?,
              species: species,
              subclass: record['subclass'] as String?,
              rtkPointNumber: record['rtk_point_number'] as String?,
              pinnedCodes: _activeProtocol?.speciesConfig.pinnedSpecies ?? const ['SPALT', 'SPPAT', 'BARE', 'DEAD'],
            );
          }).toList();
          
          if (_plots.isNotEmpty) {
            _nextPlotNumber = _plots.map((p) => p.plotNumber).reduce((a, b) => a > b ? a : b) + 1;
          }
        });
      } else if (widget.monitoringType == 'hydrology') {
        final hydroRecords = await database.query(
          'hydrology_records',
          where: 'outing_id = ?',
          whereArgs: [widget.draftId],
          limit: 1,
        );
        
        if (hydroRecords.isNotEmpty) {
          final record = hydroRecords.first;
          setState(() {
            if (record['area_treatment'] != null) {
              _areaTreatmentController.text = record['area_treatment'] as String;
            }
            if (record['wlr_type'] != null) {
              _wlrTypeController.text = record['wlr_type'] as String;
            }
            if (record['serial_number'] != null) {
              _serialNumberController.text = record['serial_number'] as String;
            }
            if (record['waypoint_number'] != null) {
              _waypointNumberController.text = record['waypoint_number'] as String;
            }
            if (record['rtk_elevation_navd88_m'] != null) {
              _rtkElevationController.text = record['rtk_elevation_navd88_m'].toString();
            }
            if (record['water_above_below_nut_m'] != null) {
              _waterAboveBelowController.text = record['water_above_below_nut_m'].toString();
            }
            if (record['well_rim_to_water_m'] != null) {
              _wellRimToWaterController.text = record['well_rim_to_water_m'].toString();
            }
            if (record['well_rim_to_marsh_m'] != null) {
              _wellRimToMarshController.text = record['well_rim_to_marsh_m'].toString();
            }
          });
        }
      } else if (widget.monitoringType == 'elevation') {
        final elevRecords = await database.query(
          'elevation_records',
          where: 'outing_id = ?',
          whereArgs: [widget.draftId],
          limit: 1,
        );
        
        if (elevRecords.isNotEmpty) {
          final record = elevRecords.first;
          setState(() {
            if (record['transect_id'] != null) {
              _transectIdController.text = record['transect_id'] as String;
            }
            if (record['point_number'] != null) {
              _pointNumberController.text = record['point_number'].toString();
            }
            if (record['latitude'] != null) {
              _latitudeController.text = record['latitude'].toString();
            }
            if (record['longitude'] != null) {
              _longitudeController.text = record['longitude'].toString();
            }
            if (record['elevation_navd88_m'] != null) {
              _elevationNavd88Controller.text = record['elevation_navd88_m'].toString();
            }
            if (record['feature_type'] != null) {
              _featureTypeController.text = record['feature_type'] as String;
            }
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading draft: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    for (final plot in _plots) {
      plot.dispose();
    }
    _siteNameController.dispose();
    _otherMembersController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _areaTreatmentController.dispose();
    _wlrTypeController.dispose();
    _serialNumberController.dispose();
    _waypointNumberController.dispose();
    _rtkElevationController.dispose();
    _waterAboveBelowController.dispose();
    _wellRimToWaterController.dispose();
    _wellRimToMarshController.dispose();
    _transectIdController.dispose();
    _pointNumberController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _elevationNavd88Controller.dispose();
    _featureTypeController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// Get GPS location and update plot coordinates
  Future<void> _getGPSLocation(int plotIndex) async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enable location services')),
          );
        }
        return;
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permission denied')),
            );
          }
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Location permissions permanently denied'),
            ),
          );
        }
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // Update plot coordinates
      setState(() {
        _plots[plotIndex].latitude = position.latitude;
        _plots[plotIndex].longitude = position.longitude;
        _plots[plotIndex].latController.text = position.latitude.toStringAsFixed(6);
        _plots[plotIndex].lngController.text = position.longitude.toStringAsFixed(6);
      });

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ GPS error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleMap = {
      'vegetation': 'Vegetation Monitoring Form',
      'hydrology': 'Hydrology Monitoring Form',
      'elevation': 'Elevation Monitoring Form',
    };

    final title = titleMap[widget.monitoringType] ?? 'Field Session Form';

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _onBackPressed();
      },
      child: Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // COMMON FIELDS FOR ALL FORMS
              _buildSectionHeader('Field Session Information'),
              _buildReadOnlyField(
                'Observer',
                ref.watch(authProvider).user?.fullName ?? '',
                Icons.person,
              ),
              _buildTextField(_siteNameController, 'Site Name', Icons.location_on),
              _buildTextField(_otherMembersController, 'Other Team Members', Icons.people, maxLines: 2),
              _buildTimeField(_startTimeController, 'Start Time'),
              _buildTimeField(_endTimeController, 'End Time'),
              _buildVisibilitySelector(),

              const SizedBox(height: 24),

              // MONITORING TYPE SPECIFIC FIELDS
              if (widget.monitoringType == 'vegetation')
                _buildVegetationForm()
              else if (widget.monitoringType == 'hydrology')
                _buildHydrologyForm()
              else if (widget.monitoringType == 'elevation')
                _buildElevationForm(),

              const SizedBox(height: 24),

              // Submit Button
              ElevatedButton.icon(
                onPressed: () => _saveFieldOuting(context, ref),
                icon: const Icon(Icons.save),
                label: const Text('Save Field Session'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 8),

              // Save as Draft Button
              OutlinedButton.icon(
                onPressed: () => _saveDraft(context, ref),
                icon: const Icon(Icons.description),
                label: const Text('Save as Draft'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildVegetationForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionHeader('Vegetation Plots'),
        Text(
          '${_plots.length} plot(s) added',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 12),

        // List of plots
        ..._plots.asMap().entries.map((entry) {
          int index = entry.key;
          PlotData plot = entry.value;
          return _buildPlotCard(index, plot);
        }),

        const SizedBox(height: 12),

        // Add new plot button
        OutlinedButton.icon(
          onPressed: () {
            setState(() {
              _plots.add(PlotData(
                transectId: _plots.isNotEmpty ? _plots.first.transectId : '',
                plotNumber: _nextPlotNumber++,
                habitatType: '',
                distanceAlongTransect: 0,
                latitude: 0,
                longitude: 0,
                canopyHeight: 0,
                thatchHeight: 0,
                species: [],
                pinnedCodes: _activeProtocol?.speciesConfig.pinnedSpecies ?? const ['SPALT', 'SPPAT', 'BARE', 'DEAD'],
              ));
            });
          },
          icon: const Icon(Icons.add),
          label: const Text('Add New Plot'),
        ),
      ],
    );
  }

  Widget _buildPlotCard(int index, PlotData plot) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Plot header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Plot ${plot.plotNumber}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (_plots.length > 1)
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _plots.removeAt(index).dispose();
                      });
                    },
                  ),
              ],
            ),
            const SizedBox(height: 12),

            // Plot fields — conditional per protocol
            if (!(_activeProtocol?.isFieldHidden('transect_id') ?? false))
              _buildPlotTextField(
                index,
                'transectId',
                plot.transectId,
                'Transect ID',
                Icons.timeline,
              ),
            _buildPlotTextField(
              index,
              'plotId',
              '',
              'Plot ID (e.g. CB_T1_P1)',
              Icons.tag,
              isOptional: true,
              controller: plot.plotIdController,
            ),
            if (!(_activeProtocol?.isFieldHidden('habitat_type') ?? false))
              _buildPlotTextField(
                index,
                'habitatType',
                plot.habitatType,
                'Habitat Type',
                Icons.terrain,
                isDropdown: true,
                dropdownOptions: _habitatOptions,
              ),
            if (!(_activeProtocol?.isFieldHidden('distance_along_transect_m') ?? false))
              _buildPlotTextField(
                index,
                'distanceAlongTransect',
                plot.distanceAlongTransect == 0 ? '' : plot.distanceAlongTransect.toString(),
                'Distance Along Transect (m)',
                Icons.straighten,
                isNumber: true,
              ),
            _buildPlotTextField(
              index,
              'latitude',
              '',
              'Latitude',
              Icons.location_on,
              isNumber: true,
              controller: plot.latController,
            ),
            _buildPlotTextField(
              index,
              'longitude',
              '',
              'Longitude',
              Icons.location_on,
              isNumber: true,
              controller: plot.lngController,
            ),

            // GPS Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton.icon(
                onPressed: () => _getGPSLocation(index),
                icon: const Icon(Icons.my_location),
                label: const Text('Get GPS Location'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            if (!(_activeProtocol?.isFieldHidden('canopy_height_m') ?? false))
              _buildPlotTextField(
                index,
                'canopyHeight',
                plot.canopyHeight == 0 ? '' : plot.canopyHeight.toString(),
                'Canopy Height (m)',
                Icons.height,
                isNumber: true,
              ),
            if (!(_activeProtocol?.isFieldHidden('thatch_height_m') ?? false))
              _buildPlotTextField(
                index,
                'thatchHeight',
                plot.thatchHeight == 0 ? '' : plot.thatchHeight.toString(),
                'Thatch Height (m)',
                Icons.height,
                isNumber: true,
              ),
            if (!(_activeProtocol?.isFieldHidden('elevation_navd88_m') ?? false))
              _buildPlotTextField(
                index,
                'elevation',
                plot.elevation?.toString() ?? '',
                'Elevation (m)',
                Icons.landscape,
                isNumber: true,
                isOptional: true,
              ),

            // UASCommunity extra fields
            if (_activeProtocol?.hasExtraField('rtk_point_number') ?? false)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  controller: plot.rtkPointNumberController,
                  decoration: const InputDecoration(
                    labelText: 'RTK Point #',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.pin_drop),
                  ),
                  onChanged: (v) => setState(() => plot.rtkPointNumber = v.isEmpty ? null : v),
                ),
              ),
            if (_activeProtocol?.hasExtraField('subclass') ?? false)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: DropdownButtonFormField<String>(
                  value: plot.subclass,
                  decoration: const InputDecoration(
                    labelText: 'Subclass',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.category),
                  ),
                  isExpanded: true,
                  items: (_activeProtocol!.subclassOptions ?? [])
                      .map((opt) => DropdownMenuItem(
                            value: opt,
                            child: Text(opt, overflow: TextOverflow.ellipsis),
                          ))
                      .toList(),
                  onChanged: (v) => setState(() => plot.subclass = v),
                ),
              ),

            _buildPlotTextField(
              index,
              'notes',
              plot.notes ?? '',
              'Notes',
              Icons.note,
              maxLines: 2,
              isOptional: true,
            ),

            const SizedBox(height: 16),

            // Photo section
            Text(
              'Plot Photo',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (plot.photoFile != null)
              Stack(
                children: [
                  Image.file(
                    plot.photoFile!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.red[400]),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          _plots[index].photoFile = null;
                          _plots[index].photoPath = null;
                        });
                      },
                    ),
                  ),
                ],
              )
            else
              Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text('No photo selected'),
                ),
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _pickImageFromCamera(index),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Take Photo'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _pickImageFromGallery(index),
                    icon: const Icon(Icons.image),
                    label: const Text('Choose Photo'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Divider(),
            const SizedBox(height: 16),

            // Species observations
            _SpeciesInput(
              plot: plot,
              allSpecies: _allSpecies,
              onChanged: () => setState(() {}),
              coverIncrement: _activeProtocol?.speciesConfig.coverIncrement ?? 1,
              pinnedCodes: _activeProtocol?.speciesConfig.pinnedSpecies ?? const ['SPALT', 'SPPAT', 'BARE', 'DEAD'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlotTextField(
    int plotIndex,
    String field,
    String currentValue,
    String label,
    IconData icon, {
    bool isNumber = false,
    bool isDropdown = false,
    bool isOptional = false,
    int maxLines = 1,
    List<String>? dropdownOptions,
    TextEditingController? controller,
  }) {
    if (isDropdown && dropdownOptions != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: DropdownButtonFormField<String>(
          initialValue: currentValue.isEmpty ? null : currentValue,
          items: dropdownOptions.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                switch (field) {
                  case 'habitatType':
                    _plots[plotIndex].habitatType = value;
                }
              });
            }
          },
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(icon),
          ),
          validator: (value) {
            if (!isOptional && (value == null || value.isEmpty)) {
              return 'This field is required';
            }
            return null;
          },
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        initialValue: controller != null ? null : currentValue,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
        onChanged: (value) {
          setState(() {
            switch (field) {
              case 'plotId':
                _plots[plotIndex].plotId = value;
                _plots[plotIndex].plotIdManuallySet = value.isNotEmpty;
              case 'transectId':
                _plots[plotIndex].transectId = value;
                if (!_plots[plotIndex].plotIdManuallySet) {
                  final id = _generatePlotId(
                    value,
                    _plots[plotIndex].plotNumber,
                  );
                  _plots[plotIndex].plotId = id;
                  _plots[plotIndex].plotIdController.text = id;
                }
              case 'distanceAlongTransect':
                _plots[plotIndex].distanceAlongTransect = double.tryParse(value) ?? 0;
              case 'latitude':
                _plots[plotIndex].latitude = double.tryParse(value) ?? 0;
              case 'longitude':
                _plots[plotIndex].longitude = double.tryParse(value) ?? 0;
              case 'canopyHeight':
                _plots[plotIndex].canopyHeight = double.tryParse(value) ?? 0;
              case 'thatchHeight':
                _plots[plotIndex].thatchHeight = double.tryParse(value) ?? 0;
              case 'elevation':
                _plots[plotIndex].elevation = double.tryParse(value);
              case 'notes':
                _plots[plotIndex].notes = value;
            }
          });
        },
        validator: (value) {
          if (!isOptional && (value == null || value.isEmpty)) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildHydrologyForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionHeader('Hydrology Measurement Information'),
        _buildTextField(_areaTreatmentController, 'Area Treatment', Icons.eco, isOptional: true),
        _buildTextField(_wlrTypeController, 'WLR Type', Icons.water, isOptional: true),
        _buildTextField(_serialNumberController, 'Serial Number', Icons.fingerprint, isOptional: true),
        _buildTextField(_waypointNumberController, 'Waypoint Number', Icons.location_on, inputType: TextInputType.number),
        _buildTextField(_rtkElevationController, 'RTK Elevation (NAVD88 m)', Icons.height, inputType: TextInputType.number),
        _buildTextField(_waterAboveBelowController, 'Water Above/Below NUT (m)', Icons.water, inputType: TextInputType.number, isOptional: true),
        _buildTextField(_wellRimToWaterController, 'Well Rim to Water (m)', Icons.water, inputType: TextInputType.number, isOptional: true),
        _buildTextField(_wellRimToMarshController, 'Well Rim to Marsh (m)', Icons.water, inputType: TextInputType.number, isOptional: true),
      ],
    );
  }

  Widget _buildElevationForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionHeader('Elevation Point Information'),
        _buildTextField(_transectIdController, 'Transect ID', Icons.timeline),
        _buildTextField(_pointNumberController, 'Point Number', Icons.numbers, inputType: TextInputType.number),
        _buildTextField(_latitudeController, 'Latitude', Icons.location_on, inputType: TextInputType.number),
        _buildTextField(_longitudeController, 'Longitude', Icons.location_on, inputType: TextInputType.number),
        _buildTextField(_elevationNavd88Controller, 'Elevation (NAVD88 m)', Icons.landscape, inputType: TextInputType.number),
        _buildTextField(_featureTypeController, 'Feature Type', Icons.landscape, isOptional: true),
      ],
    );
  }

  Widget _buildVisibilitySelector() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Visibility', style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'public', label: Text('Public'), icon: Icon(Icons.public, size: 16)),
              ButtonSegment(value: 'private', label: Text('Private'), icon: Icon(Icons.lock, size: 16)),
              ButtonSegment(value: 'embargo', label: Text('Embargo'), icon: Icon(Icons.schedule, size: 16)),
            ],
            selected: {_visibility},
            onSelectionChanged: (v) => setState(() {
              _visibility = v.first;
              if (_visibility != 'embargo') _embargoUntil = null;
            }),
          ),
          if (_visibility == 'embargo') ...[
            const SizedBox(height: 12),
            OutlinedButton.icon(
              icon: const Icon(Icons.calendar_today, size: 16),
              label: Text(_embargoUntil != null
                  ? 'Embargo until: $_embargoUntil'
                  : 'Pick embargo date'),
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(const Duration(days: 90)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 3650)),
                );
                if (picked != null && mounted) {
                  setState(() => _embargoUntil = picked.toIso8601String().substring(0, 10));
                }
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.green[700],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value, IconData icon) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
          borderRadius: BorderRadius.circular(4),
          color: theme.colorScheme.surfaceContainerHighest,
        ),
        child: Row(
          children: [
            Icon(icon, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(value, style: theme.textTheme.bodyLarge),
                ],
              ),
            ),
            Icon(Icons.lock_outline, size: 14, color: theme.colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType inputType = TextInputType.text,
    int maxLines = 1,
    bool isOptional = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
        keyboardType: inputType,
        maxLines: maxLines,
        validator: (value) {
          if (!isOptional && (value == null || value.isEmpty)) {
            if (label.contains('Crew Leader') || label.contains('Site Name')) {
              return 'This field is required';
            }
          }
          return null;
        },
      ),
    );
  }

  Widget _buildTimeField(
    TextEditingController controller,
    String label,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.access_time),
        ),
        readOnly: true,
        onTap: () async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (time != null && mounted) {
            controller.text = time.format(context);
          }
        },
      ),
    );
  }

  /// Copies the picked image to the app's documents directory so the path
  /// remains valid after iOS clears its temporary cache.
  Future<String> _copyImageToPermanentStorage(String tempPath) async {
    final docsDir = await getApplicationDocumentsDirectory();
    final photosDir = Directory(p.join(docsDir.path, 'photos'));
    if (!await photosDir.exists()) await photosDir.create(recursive: true);
    final filename = '${DateTime.now().millisecondsSinceEpoch}${p.extension(tempPath)}';
    final dest = p.join(photosDir.path, filename);
    await File(tempPath).copy(dest);
    return dest;
  }

  Future<void> _pickImageFromCamera(int plotIndex) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      if (image != null && mounted) {
        final permanentPath = await _copyImageToPermanentStorage(image.path);
        setState(() {
          _plots[plotIndex].photoFile = File(permanentPath);
          _plots[plotIndex].photoPath = permanentPath;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error taking photo: $e')),
        );
      }
    }
  }

  Future<void> _pickImageFromGallery(int plotIndex) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      if (image != null && mounted) {
        final permanentPath = await _copyImageToPermanentStorage(image.path);
        setState(() {
          _plots[plotIndex].photoFile = File(permanentPath);
          _plots[plotIndex].photoPath = permanentPath;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error selecting photo: $e')),
        );
      }
    }
  }

  DateTime? _parseTimeString(String timeStr) {
    if (timeStr.isEmpty) return null;

    try {
      final now = DateTime.now();
      // Handle 12-hour format with AM/PM (e.g., "3:51 PM" or "3:51PM")
      final cleanTime = timeStr.replaceAll(' ', '').toUpperCase();
      final isPM = cleanTime.contains('PM');
      final isAM = cleanTime.contains('AM');

      // Remove AM/PM
      String timePart = cleanTime.replaceAll('PM', '').replaceAll('AM', '');
      final parts = timePart.split(':');

      if (parts.length != 2) return null;

      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      // Convert to 24-hour format
      if (isPM && hour != 12) {
        hour += 12;
      } else if (isAM && hour == 12) {
        hour = 0;
      }

      return DateTime(now.year, now.month, now.day, hour, minute);
    } catch (e) {
      return null;
    }
  }

  Future<void> _saveDraft(BuildContext context, WidgetRef ref) async {
    // Don't require validation for drafts - they can be incomplete
    try {
      // If this was an existing draft, delete it first so we can recreate it
      if (widget.draftId != null) {
        final service = ref.read(fieldOutingServiceProvider);
        await service.deleteDraft(widget.draftId!);
      }

      // Parse start and end times if provided
      final startTime = _startTimeController.text.isNotEmpty
          ? _parseTimeString(_startTimeController.text)
          : null;
      final endTime = _endTimeController.text.isNotEmpty
          ? _parseTimeString(_endTimeController.text)
          : null;

      // Create the field outing object as draft
      final outing = FieldOuting(
        orgId: ref.read(selectedOrgIdProvider),
        createdByUserId: ref.read(authProvider).user?.id,
        siteName: _siteNameController.text,
        otherMembers: _otherMembersController.text.isEmpty
            ? null
            : _otherMembersController.text,
        monitoringType: widget.monitoringType,
        startTime: startTime,
        endTime: endTime,
        isDraft: true,
        visibility: _visibility,
        embargoUntil: _embargoUntil,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final service = ref.read(fieldOutingServiceProvider);
      final now = DateTime.now().toIso8601String();

      if (widget.monitoringType == 'vegetation') {
        final protocolCode = _activeProtocol?.protocolCode ?? 'MassMarshVeg';
        final childRecords = _plots.map((plot) {
          final effectivePlotId = plot.plotId.isNotEmpty
              ? plot.plotId
              : _generatePlotId(plot.transectId, plot.plotNumber);
          return {
          'local_id': 'veg_${DateTime.now().millisecondsSinceEpoch}_${plot.plotNumber}',
          'transect_id': plot.transectId,
          'plot_number': plot.plotNumber,
          'plot_id': effectivePlotId.isNotEmpty ? effectivePlotId : null,
          'habitat_type': plot.habitatType,
          'distance_along_transect_m': plot.distanceAlongTransect,
          'latitude': plot.latitude,
          'longitude': plot.longitude,
          'elevation_m': plot.elevation,
          'canopy_height_m': plot.canopyHeight,
          'thatch_height_m': plot.thatchHeight,
          'species_observations': jsonEncode(plot.species.map((s) => {
            'species_code': s.speciesCode,
            'percentage_cover': s.percentageCover,
          }).toList()),
          'photo_local_path': plot.photoPath,
          'notes': plot.notes,
          'protocol_code': protocolCode,
          'subclass': plot.subclass,
          'rtk_point_number': plot.rtkPointNumber,
          'sync_status': 'pending',
          'created_at': now,
          'updated_at': now,
          };
        }).toList();
        await service.saveFieldOutingWithChildren(outing, childRecords, 'vegetation_records');
      } else if (widget.monitoringType == 'hydrology') {
        final childRecords = [
          {
            'local_id': 'hydro_${DateTime.now().millisecondsSinceEpoch}',
            'area_treatment': _areaTreatmentController.text.isEmpty ? null : _areaTreatmentController.text,
            'wlr_type': _wlrTypeController.text.isEmpty ? null : _wlrTypeController.text,
            'serial_number': _serialNumberController.text,
            'waypoint_number': _waypointNumberController.text,
            'rtk_elevation_navd88_m': double.tryParse(_rtkElevationController.text),
            'water_above_below_nut_m': double.tryParse(_waterAboveBelowController.text),
            'well_rim_to_water_m': double.tryParse(_wellRimToWaterController.text),
            'well_rim_to_marsh_m': double.tryParse(_wellRimToMarshController.text),
            'sync_status': 'pending',
            'created_at': now,
            'updated_at': now,
          }
        ];
        await service.saveFieldOutingWithChildren(outing, childRecords, 'hydrology_records');
      } else if (widget.monitoringType == 'elevation') {
        final childRecords = [
          {
            'local_id': 'elev_${DateTime.now().millisecondsSinceEpoch}',
            'transect_id': _transectIdController.text,
            'point_number': int.tryParse(_pointNumberController.text) ?? 1,
            'latitude': double.tryParse(_latitudeController.text) ?? 0.0,
            'longitude': double.tryParse(_longitudeController.text) ?? 0.0,
            'elevation_navd88_m': double.tryParse(_elevationNavd88Controller.text) ?? 0.0,
            'feature_type': _featureTypeController.text.isEmpty ? null : _featureTypeController.text,
            'sync_status': 'pending',
            'created_at': now,
            'updated_at': now,
          }
        ];
        await service.saveFieldOutingWithChildren(outing, childRecords, 'elevation_records');
      } else {
        await service.saveFieldOuting(outing);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Draft saved successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        // Navigate back after snackbar appears
        await Future.delayed(const Duration(milliseconds: 500));
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving draft: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _saveFieldOuting(BuildContext context, WidgetRef ref) async {
    if (!_formKey.currentState!.validate()) {
      // Scroll to the top so the user can see the highlighted required fields.
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.error_outline, color: Colors.white, size: 20),
              SizedBox(width: 10),
              Expanded(
                child: Text('Please fill in all required fields before saving.'),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 4),
        ),
      );
      return;
    }

    try {
      // If this was a draft, delete it first
      if (widget.draftId != null) {
        final service = ref.read(fieldOutingServiceProvider);
        await service.deleteDraft(widget.draftId!);
      }

      // Parse start and end times
      final startTime = _parseTimeString(_startTimeController.text);
      final endTime = _parseTimeString(_endTimeController.text);

      // Create the field outing object
      final outing = FieldOuting(
        orgId: ref.read(selectedOrgIdProvider),
        createdByUserId: ref.read(authProvider).user?.id,
        siteName: _siteNameController.text,
        otherMembers: _otherMembersController.text.isEmpty
            ? null
            : _otherMembersController.text,
        monitoringType: widget.monitoringType,
        startTime: startTime,
        endTime: endTime,
        isDraft: false,
        visibility: _visibility,
        embargoUntil: _embargoUntil,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final service = ref.read(fieldOutingServiceProvider);
      final now = DateTime.now().toIso8601String();

      if (widget.monitoringType == 'vegetation') {
        final protocolCode = _activeProtocol?.protocolCode ?? 'MassMarshVeg';
        final childRecords = _plots.map((plot) {
          final effectivePlotId = plot.plotId.isNotEmpty
              ? plot.plotId
              : _generatePlotId(plot.transectId, plot.plotNumber);
          return {
          'local_id': 'veg_${DateTime.now().millisecondsSinceEpoch}_${plot.plotNumber}',
          'transect_id': plot.transectId,
          'plot_number': plot.plotNumber,
          'plot_id': effectivePlotId.isNotEmpty ? effectivePlotId : null,
          'habitat_type': plot.habitatType,
          'distance_along_transect_m': plot.distanceAlongTransect,
          'latitude': plot.latitude,
          'longitude': plot.longitude,
          'elevation_m': plot.elevation,
          'canopy_height_m': plot.canopyHeight,
          'thatch_height_m': plot.thatchHeight,
          'species_observations': jsonEncode(plot.species.map((s) => {
            'species_code': s.speciesCode,
            'percentage_cover': s.percentageCover,
          }).toList()),
          'photo_local_path': plot.photoPath,
          'notes': plot.notes,
          'protocol_code': protocolCode,
          'subclass': plot.subclass,
          'rtk_point_number': plot.rtkPointNumber,
          'sync_status': 'pending',
          'created_at': now,
          'updated_at': now,
          };
        }).toList();
        await service.saveFieldOutingWithChildren(outing, childRecords, 'vegetation_records');
      } else if (widget.monitoringType == 'hydrology') {
        final childRecords = [
          {
            'local_id': 'hydro_${DateTime.now().millisecondsSinceEpoch}',
            'area_treatment': _areaTreatmentController.text.isEmpty ? null : _areaTreatmentController.text,
            'wlr_type': _wlrTypeController.text.isEmpty ? null : _wlrTypeController.text,
            'serial_number': _serialNumberController.text,
            'waypoint_number': _waypointNumberController.text,
            'rtk_elevation_navd88_m': double.tryParse(_rtkElevationController.text),
            'water_above_below_nut_m': double.tryParse(_waterAboveBelowController.text),
            'well_rim_to_water_m': double.tryParse(_wellRimToWaterController.text),
            'well_rim_to_marsh_m': double.tryParse(_wellRimToMarshController.text),
            'sync_status': 'pending',
            'created_at': now,
            'updated_at': now,
          }
        ];
        await service.saveFieldOutingWithChildren(outing, childRecords, 'hydrology_records');
      } else if (widget.monitoringType == 'elevation') {
        final childRecords = [
          {
            'local_id': 'elev_${DateTime.now().millisecondsSinceEpoch}',
            'transect_id': _transectIdController.text,
            'point_number': int.tryParse(_pointNumberController.text) ?? 1,
            'latitude': double.tryParse(_latitudeController.text) ?? 0.0,
            'longitude': double.tryParse(_longitudeController.text) ?? 0.0,
            'elevation_navd88_m': double.tryParse(_elevationNavd88Controller.text) ?? 0.0,
            'feature_type': _featureTypeController.text.isEmpty ? null : _featureTypeController.text,
            'sync_status': 'pending',
            'created_at': now,
            'updated_at': now,
          }
        ];
        await service.saveFieldOutingWithChildren(outing, childRecords, 'elevation_records');
      } else {
        await service.saveFieldOuting(outing);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Field session saved successfully!'),
            duration: Duration(seconds: 2),
          ),
        );

        // Navigate back after snackbar appears
        await Future.delayed(const Duration(milliseconds: 500));
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving field session: $e')),
        );
      }
    }
  }
}

class _SpeciesInput extends StatefulWidget {
  final PlotData plot;
  final List<SpeciesItem> allSpecies;
  final VoidCallback onChanged;
  final int coverIncrement;
  final List<String> pinnedCodes;

  const _SpeciesInput({
    required this.plot,
    required this.allSpecies,
    required this.onChanged,
    this.coverIncrement = 1,
    this.pinnedCodes = const ['SPALT', 'SPPAT', 'BARE', 'DEAD'],
  });

  @override
  State<_SpeciesInput> createState() => _SpeciesInputState();
}

class _SpeciesInputState extends State<_SpeciesInput> {
  static const _pinnedLabels = {
    'SPALT': 'Smooth Cordgrass',
    'SPPAT': 'Salt Meadow Cordgrass',
    'BARE': 'Bare Ground',
    'DEAD': 'Dead Vegetation',
  };

  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<SpeciesItem> _filteredSpecies() {
    final q = _searchQuery.toLowerCase().trim();
    if (q.isEmpty) return [];

    final addedCodes = widget.plot.species.map((s) => s.speciesCode).toSet();

    return widget.allSpecies.where((s) {
      if (widget.pinnedCodes.contains(s.code)) return false;
      if (addedCodes.contains(s.code)) return false;
      final haystack = '${s.label.toLowerCase()} ${s.scientificName.toLowerCase()}';
      return s.code.toLowerCase().contains(q) || haystack.contains(q);
    }).toList()
      ..sort((a, b) {
        final aStarts = a.code.toLowerCase().startsWith(q) ? 0 : 1;
        final bStarts = b.code.toLowerCase().startsWith(q) ? 0 : 1;
        return aStarts.compareTo(bStarts);
      });
  }

  void _updatePinned(String code, String rawValue) {
    final percent = int.tryParse(rawValue);
    final plot = widget.plot;
    setState(() {
      plot.species.removeWhere((s) => s.speciesCode == code);
      if (percent != null && percent > 0) {
        plot.species.add(SpeciesObservation(
          speciesCode: code,
          percentageCover: percent.clamp(0, 100),
        ));
      }
    });
    widget.onChanged();
  }

  void _addExtra(SpeciesItem species) {
    final plot = widget.plot;
    if (plot.species.any((s) => s.speciesCode == species.code)) return;
    setState(() {
      plot.species.add(SpeciesObservation(speciesCode: species.code, percentageCover: 0));
      plot.extraControllers[species.code] = TextEditingController(text: '');
      _searchController.clear();
      _searchQuery = '';
    });
    widget.onChanged();
  }

  void _removeExtra(String code) {
    final plot = widget.plot;
    setState(() {
      plot.species.removeWhere((s) => s.speciesCode == code);
      plot.extraControllers[code]?.dispose();
      plot.extraControllers.remove(code);
    });
    widget.onChanged();
  }

  void _updateExtra(String code, String rawValue) {
    final percent = int.tryParse(rawValue);
    final plot = widget.plot;
    final idx = plot.species.indexWhere((s) => s.speciesCode == code);
    if (idx < 0 || percent == null) return;
    setState(() {
      plot.species[idx] = SpeciesObservation(
        speciesCode: code,
        percentageCover: percent.clamp(0, 100),
      );
    });
    widget.onChanged();
  }

  Widget _speciesLabel(BuildContext context, String code, String commonLabel, String scientificName) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(commonLabel, style: theme.textTheme.bodyMedium),
        Text(
          scientificName,
          style: theme.textTheme.bodySmall?.copyWith(
            fontStyle: FontStyle.italic,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final plot = widget.plot;
    final extraSpecies = plot.species
        .where((s) => !widget.pinnedCodes.contains(s.speciesCode))
        .toList();
    final filtered = _filteredSpecies();

    // Build a lookup map for extra species scientific names
    final speciesMap = {for (final s in widget.allSpecies) s.code: s};

    // Helper: builds a cover input — TextField for increment=1, ChoiceChips otherwise
    Widget buildCoverInput({
      required String code,
      required TextEditingController? controller,
      required int currentValue,
      required void Function(String) onChanged,
    }) {
      if (widget.coverIncrement == 1) {
        return SizedBox(
          width: 64,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              suffixText: '%',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              isDense: true,
            ),
            onChanged: onChanged,
          ),
        );
      }
      return Wrap(
        spacing: 4,
        runSpacing: 4,
        children: List.generate(11, (i) {
          final v = i * 10;
          return ChoiceChip(
            label: Text('$v', style: const TextStyle(fontSize: 11)),
            selected: currentValue == v,
            onSelected: (_) => onChanged(v.toString()),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
          );
        }),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          'Species in this Plot (${plot.species.length})',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // Pinned species rows (always shown in fixed order)
        ...widget.pinnedCodes.map((code) {
          final commonLabel = speciesMap[code]?.label ?? _pinnedLabels[code] ?? code;
          final scientificName = speciesMap[code]?.scientificName ?? '';
          final controller = plot.pinnedControllers[code];
          final currentValue = plot.species
              .firstWhere((s) => s.speciesCode == code,
                  orElse: () => SpeciesObservation(speciesCode: code, percentageCover: 0))
              .percentageCover;
          if (widget.coverIncrement == 1) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: _speciesLabel(context, code, '$code \u2013 $commonLabel', scientificName),
                  ),
                  buildCoverInput(
                    code: code,
                    controller: controller,
                    currentValue: currentValue,
                    onChanged: (v) => _updatePinned(code, v),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _speciesLabel(context, code, '$code \u2013 $commonLabel', scientificName),
                const SizedBox(height: 4),
                buildCoverInput(
                  code: code,
                  controller: controller,
                  currentValue: currentValue,
                  onChanged: (v) => _updatePinned(code, v),
                ),
              ],
            ),
          );
        }),

        // Extra (non-pinned) added species
        if (extraSpecies.isNotEmpty) ...[
          const Divider(height: 20),
          ...extraSpecies.map((obs) {
            final code = obs.speciesCode;
            final item = speciesMap[code];
            final commonLabel = item?.label ?? code;
            final scientificName = item?.scientificName ?? '';
            final controller = plot.extraControllers[code] ??
                TextEditingController(text: obs.percentageCover.toString());
            if (widget.coverIncrement == 1) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _speciesLabel(context, code, commonLabel, scientificName)),
                    buildCoverInput(
                      code: code,
                      controller: controller,
                      currentValue: obs.percentageCover,
                      onChanged: (v) => _updateExtra(code, v),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 18, color: Colors.red),
                      padding: EdgeInsets.zero,
                      onPressed: () => _removeExtra(code),
                    ),
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: _speciesLabel(context, code, commonLabel, scientificName)),
                      IconButton(
                        icon: const Icon(Icons.close, size: 18, color: Colors.red),
                        padding: EdgeInsets.zero,
                        onPressed: () => _removeExtra(code),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  buildCoverInput(
                    code: code,
                    controller: controller,
                    currentValue: obs.percentageCover,
                    onChanged: (v) => _updateExtra(code, v),
                  ),
                ],
              ),
            );
          }),
        ],

        // Search field
        const SizedBox(height: 12),
        TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search, size: 20),
            hintText: 'Search to add more species...',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            isDense: true,
          ),
          onChanged: (v) => setState(() => _searchQuery = v),
        ),

        // Search results
        if (filtered.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            constraints: const BoxConstraints(maxHeight: 220),
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: filtered.length,
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final s = filtered[i];
                return ListTile(
                  dense: true,
                  title: Text(s.label, style: theme.textTheme.bodyMedium),
                  subtitle: Text(
                    s.scientificName,
                    style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
                  ),
                  trailing: const Icon(Icons.add, size: 18),
                  onTap: () => _addExtra(s),
                );
              },
            ),
          ),
      ],
    );
  }
}
