import 'dart:io';
import 'package:path/join.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/database/form_submission.dart';
import 'dart:convert';

/// DEPRECATED: Use [AppDatabase] instead.
///
/// This class is kept for backward compatibility but will be removed in a
/// future version. All new code should use `AppDatabase.instance` instead.
@Deprecated('Use AppDatabase from ../database/app_database.dart instead')
class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('marsh_app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE form_submissions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        org_id INTEGER NOT NULL,
        form_type TEXT NOT NULL,
        data TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        synced INTEGER NOT NULL DEFAULT 0,
        synced_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE form_configs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        org_id INTEGER NOT NULL,
        config_version TEXT NOT NULL,
        config_hash TEXT NOT NULL,
        config_data TEXT NOT NULL,
        downloaded_at TEXT NOT NULL,
        last_validated_at TEXT
      )
    ''');
  }

  // Insert form submission
  Future<int> insertSubmission(FormSubmission submission) async {
    final db = await database;
    return await db.insert(
      'form_submissions',
      {
        'org_id': submission.orgId,
        'form_type': submission.formType,
        'data': jsonEncode(submission.data),
        'created_at': submission.createdAt.toIso8601String(),
        'updated_at': submission.updatedAt.toIso8601String(),
        'synced': submission.synced ? 1 : 0,
        'synced_at': submission.syncedAt?.toIso8601String(),
      },
    );
  }

  // Get all submissions
  Future<List<FormSubmission>> getAllSubmissions() async {
    final db = await database;
    final results = await db.query('form_submissions', orderBy: 'created_at DESC');

    return results.map((json) => FormSubmission(
      id: json['id'] as int,
      orgId: json['org_id'] as int,
      formType: json['form_type'] as String,
      data: jsonDecode(json['data'] as String) as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      synced: (json['synced'] as int) == 1,
      syncedAt: json['synced_at'] != null ? DateTime.parse(json['synced_at'] as String) : null,
    )).toList();
  }

  // Export database file
  Future<File> exportDatabase() async {
    final dbPath = await getDatabasesPath();
    final dbFile = File(join(dbPath, 'marsh_app.db'));
    
    final exportDir = await getApplicationDocumentsDirectory();
    final exportPath = join(exportDir.path, 'marsh_app_export_${DateTime.now().millisecondsSinceEpoch}.db');
    
    return await dbFile.copy(exportPath);
  }

  // Import database file
  Future<void> importDatabase(String importPath) async {
    final dbPath = await getDatabasesPath();
    final targetPath = join(dbPath, 'marsh_app.db');
    
    // Close existing database
    await _database?.close();
    _database = null;
    
    // Copy imported file
    await File(importPath).copy(targetPath);
    
    // Reopen database
    await database;
  }

  Future close() async {
    final db = await database;
    await db.close();
  }
}
