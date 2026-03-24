import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import '../models/field_outing/field_outing.dart';
import '../providers/field_outing_provider.dart';

class FormScreen extends ConsumerStatefulWidget {
  final String monitoringType;

  const FormScreen({
    required this.monitoringType,
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
  final TextEditingController latController;
  final TextEditingController lngController;
  final TextEditingController plotIdController;

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
  })  : latController = TextEditingController(text: latitude == 0 ? '' : latitude.toString()),
        lngController = TextEditingController(text: longitude == 0 ? '' : longitude.toString()),
        plotIdController = TextEditingController(text: plotId);

  void dispose() {
    latController.dispose();
    lngController.dispose();
    plotIdController.dispose();
  }
}

class _FormScreenState extends ConsumerState<FormScreen> {
  late final _formKey = GlobalKey<FormState>();
  late final _crewLeaderController = TextEditingController();
  late final _siteNameController = TextEditingController();
  late final _otherMembersController = TextEditingController();
  late final _startTimeController = TextEditingController();
  late final _endTimeController = TextEditingController();

  // For vegetation monitoring - store multiple plots
  late List<PlotData> _plots;
  int _nextPlotNumber = 1;
  late final _siteAbbrController = TextEditingController();

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

  // Common species for quick selection
  static const List<String> _commonSpecies = [
    'BARE',
    'TRMAR',
    'TECAN',
    'JUBAL',
    'JUGER',
    'TYLAT',
    'PORUM',
    'SCAME',
    'SADEP',
    'PHAUS',
    'AGSTO',
    'BAHAL',
    'CASEP',
    'IMCAP',
    'IVFRU',
  ];

  String _generatePlotId(String siteAbbr, String transectId, int plotNumber) {
    final parts = [siteAbbr, transectId, 'P$plotNumber']
        .where((p) => p.isNotEmpty)
        .join('_');
    return parts;
  }

  void _refreshAutoPlotIds() {
    for (final plot in _plots) {
      if (!plot.plotIdManuallySet) {
        final id = _generatePlotId(
          _siteAbbrController.text.trim(),
          plot.transectId,
          plot.plotNumber,
        );
        plot.plotId = id;
        plot.plotIdController.text = id;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _plots = [];
    if (widget.monitoringType == 'vegetation') {
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
      _siteAbbrController.addListener(_refreshAutoPlotIds);
    }
  }

  @override
  void dispose() {
    for (final plot in _plots) {
      plot.dispose();
    }
    _siteAbbrController.dispose();
    _crewLeaderController.dispose();
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

    final title = titleMap[widget.monitoringType] ?? 'Field Outing Form';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // COMMON FIELDS FOR ALL FORMS
              _buildSectionHeader('Field Outing Information'),
              _buildTextField(_crewLeaderController, 'Crew Leader Name', Icons.person),
              _buildTextField(_siteNameController, 'Site Name', Icons.location_on),
              _buildTextField(_otherMembersController, 'Other Team Members', Icons.people, maxLines: 2),
              _buildTimeField(_startTimeController, 'Start Time'),
              _buildTimeField(_endTimeController, 'End Time'),

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
                label: const Text('Save Field Outing'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 8),

              // Save as Draft Button
              OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Saved as draft')),
                  );
                },
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
    );
  }

  Widget _buildVegetationForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionHeader('Vegetation Plots'),
        _buildTextField(
          _siteAbbrController,
          'Site Abbreviation (e.g. CB for Crane Beach)',
          Icons.bookmark_outline,
          isOptional: true,
        ),
        const SizedBox(height: 4),
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

            // Plot fields
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
            _buildPlotTextField(
              index,
              'habitatType',
              plot.habitatType,
              'Habitat Type',
              Icons.terrain,
              isDropdown: true,
              dropdownOptions: _habitatOptions,
            ),
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

            _buildPlotTextField(
              index,
              'canopyHeight',
              plot.canopyHeight == 0 ? '' : plot.canopyHeight.toString(),
              'Canopy Height (m)',
              Icons.height,
              isNumber: true,
            ),
            _buildPlotTextField(
              index,
              'thatchHeight',
              plot.thatchHeight == 0 ? '' : plot.thatchHeight.toString(),
              'Thatch Height (m)',
              Icons.height,
              isNumber: true,
            ),
            _buildPlotTextField(
              index,
              'elevation',
              plot.elevation?.toString() ?? '',
              'Elevation (m)',
              Icons.landscape,
              isNumber: true,
              isOptional: true,
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
            Text(
              'Species in this Plot (${plot.species.length})',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            if (plot.species.isEmpty)
              Text(
                'No species added yet',
                style: Theme.of(context).textTheme.bodySmall,
              )
            else
              ...plot.species.asMap().entries.map((entry) {
                int speciesIndex = entry.key;
                SpeciesObservation obs = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(obs.speciesCode),
                      ),
                      SizedBox(
                        width: 80,
                        child: Text('${obs.percentageCover}%', textAlign: TextAlign.center),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, size: 18, color: Colors.red),
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            _plots[index].species.removeAt(speciesIndex);
                          });
                        },
                      ),
                    ],
                  ),
                );
              }),

            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                _showAddSpeciesDialog(index);
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Species'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddSpeciesDialog(int plotIndex) {
    String selectedSpecies = _commonSpecies.first;
    int percentageCover = 50;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, dialogSetState) => AlertDialog(
          title: const Text('Add Species'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: selectedSpecies,
                isExpanded: true,
                items: _commonSpecies.map((species) {
                  return DropdownMenuItem(
                    value: species,
                    child: Text(species),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    dialogSetState(() {
                      selectedSpecies = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              Text('Percentage Cover: $percentageCover%'),
              Slider(
                value: percentageCover.toDouble(),
                min: 0,
                max: 100,
                divisions: 10,
                onChanged: (value) {
                  dialogSetState(() {
                    percentageCover = value.toInt();
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add to main form state
                setState(() {
                  _plots[plotIndex].species.add(
                    SpeciesObservation(
                      speciesCode: selectedSpecies,
                      percentageCover: percentageCover,
                    ),
                  );
                });
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Add'),
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
                    _siteAbbrController.text.trim(),
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

  Future<void> _pickImageFromCamera(int plotIndex) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      if (image != null && mounted) {
        setState(() {
          _plots[plotIndex].photoFile = File(image.path);
          _plots[plotIndex].photoPath = image.path;
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
        setState(() {
          _plots[plotIndex].photoFile = File(image.path);
          _plots[plotIndex].photoPath = image.path;
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

  Future<void> _saveFieldOuting(BuildContext context, WidgetRef ref) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      // Parse start and end times
      final startTime = _parseTimeString(_startTimeController.text);
      final endTime = _parseTimeString(_endTimeController.text);

      // Create the field outing object
      final outing = FieldOuting(
        orgId: 1, // Hardcoded for now, should come from auth
        crewLeader: _crewLeaderController.text,
        siteName: _siteNameController.text,
        otherMembers: _otherMembersController.text.isEmpty
            ? null
            : _otherMembersController.text,
        monitoringType: widget.monitoringType,
        startTime: startTime,
        endTime: endTime,
        isDraft: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final service = ref.read(fieldOutingServiceProvider);
      final now = DateTime.now().toIso8601String();

      if (widget.monitoringType == 'vegetation') {
        final childRecords = _plots.map((plot) {
          final effectivePlotId = plot.plotId.isNotEmpty
              ? plot.plotId
              : _generatePlotId(_siteAbbrController.text.trim(), plot.transectId, plot.plotNumber);
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
            content: Text('Field outing saved successfully!'),
            duration: Duration(seconds: 2),
          ),
        );

        // Navigate back to home after a short delay
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving field outing: $e')),
        );
      }
    }
  }
}
