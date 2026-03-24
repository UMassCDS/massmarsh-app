import 'dart:convert';
import 'package:flutter/material.dart';
import '../database/app_database.dart';
import '../models/field_outing/field_outing.dart';

class OutingDetailsScreen extends StatefulWidget {
  final FieldOuting outing;

  const OutingDetailsScreen({required this.outing, super.key});

  @override
  State<OutingDetailsScreen> createState() => _OutingDetailsScreenState();
}

class _OutingDetailsScreenState extends State<OutingDetailsScreen> {
  List<Map<String, dynamic>> _childRecords = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadChildRecords();
  }

  Future<void> _loadChildRecords() async {
    final db = await AppDatabase.instance.database;
    final id = widget.outing.id;
    if (id == null) {
      setState(() => _loading = false);
      return;
    }

    final String table;
    switch (widget.outing.monitoringType) {
      case 'vegetation':
        table = 'vegetation_records';
      case 'hydrology':
        table = 'hydrology_records';
      case 'elevation':
        table = 'elevation_records';
      default:
        setState(() => _loading = false);
        return;
    }

    final records = await db.query(table, where: 'outing_id = ?', whereArgs: [id]);
    setState(() {
      _childRecords = records;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final outing = widget.outing;

    return Scaffold(
      appBar: AppBar(
        title: Text(outing.siteName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader('Outing Info'),
            _infoRow('Crew Leader', outing.crewLeader),
            if (outing.otherMembers != null && outing.otherMembers!.isNotEmpty)
              _infoRow('Other Members', outing.otherMembers!),
            _infoRow('Monitoring Type', outing.monitoringType),
            _infoRow('Status', outing.isDraft ? 'Draft' : 'Submitted'),
            if (outing.startTime != null)
              _infoRow('Start', outing.startTime!.toString().split('.')[0]),
            if (outing.endTime != null)
              _infoRow('End', outing.endTime!.toString().split('.')[0]),
            if (outing.createdAt != null)
              _infoRow('Created', outing.createdAt!.toString().split('.')[0]),
            const SizedBox(height: 24),
            _sectionHeader('Records (${_childRecords.length})'),
            if (_loading)
              const Center(child: CircularProgressIndicator())
            else if (_childRecords.isEmpty)
              const Text('No records found.', style: TextStyle(color: Colors.grey))
            else
              ..._childRecords.asMap().entries.map((entry) =>
                _buildRecordCard(entry.key + 1, entry.value)),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text('$label:', style: const TextStyle(color: Colors.grey)),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildRecordCard(int index, Map<String, dynamic> record) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Record #$index', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ..._buildRecordRows(record),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRecordRows(Map<String, dynamic> record) {
    final skip = {'id', 'local_id', 'server_id', 'outing_id', 'sync_status', 'created_at', 'updated_at'};
    final rows = <Widget>[];

    for (final entry in record.entries) {
      if (skip.contains(entry.key) || entry.value == null) continue;

      String displayValue;
      if (entry.key == 'species_observations') {
        try {
          final List decoded = jsonDecode(entry.value as String);
          displayValue = decoded.map((s) =>
            '${s['species_code']}: ${s['percentage_cover']}%'
          ).join(', ');
        } catch (_) {
          displayValue = entry.value.toString();
        }
      } else {
        displayValue = entry.value.toString();
      }

      final label = entry.key.replaceAll('_', ' ');
      rows.add(_infoRow(label, displayValue));
    }
    return rows;
  }
}
