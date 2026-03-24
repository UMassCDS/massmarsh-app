import 'lib/models/form/form_config.dart';

void main() {
  final config = FormConfig(
    orgId: 1,
    configVersion: '1.0.0',
    configHash: 'abc123',
    commonForm: CommonFormConfig(version: '1.0', fields: []),
    vegetationForm: VegetationFormConfig(
      version: '1.0',
      repeatingGroup: RepeatingGroupDef(id: 'veg', name: 'Vegetation', fields: []),
    ),
    hydrologyForm: HydrologyFormConfig(version: '1.0', fields: []),
    elevationForm: ElevationFormConfig(
      version: '1.0',
      repeatingGroup: RepeatingGroupDef(id: 'elev', name: 'Elevation', fields: []),
    ),
    downloadedAt: DateTime.now(),
  );

  print('Config version: ${config.configVersion}');
  print('Test passed!');
}
