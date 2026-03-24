import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';
import '../database/app_database.dart';

/// Helper class for database export and import operations.
///
/// Provides convenient methods for exporting the database to share with others
/// or import from another device.
class DatabaseExportHelper {
  /// Exports the current database and opens a share dialog.
  ///
  /// Creates a timestamped copy of the database file and allows the user
  /// to share it via email, cloud storage, or other sharing options.
  ///
  /// Throws an exception if the export fails.
  static Future<void> exportDatabase() async {
    try {
      final exportedFile = await AppDatabase.instance.exportDatabase();

      // Share the file
      await Share.shareXFiles(
        [XFile(exportedFile.path)],
        subject: 'MassMarsh Database Export',
        text: 'MassMarsh field data export from ${DateTime.now().toIso8601String()}',
      );
    } catch (e) {
      throw Exception('Failed to export database: $e');
    }
  }

  /// Prompts the user to select a database file and imports it.
  ///
  /// Opens a file picker allowing the user to select a .db file to import.
  /// The imported database will completely replace the existing database.
  ///
  /// **WARNING**: This operation will erase all existing data. Users should
  /// be prompted to confirm before calling this method.
  ///
  /// Throws an exception if the import fails or if no file is selected.
  static Future<void> importDatabase() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['db'],
        dialogTitle: 'Select MassMarsh Database File',
      );

      if (result != null && result.files.single.path != null) {
        await AppDatabase.instance.importDatabase(result.files.single.path!);
      } else {
        throw Exception('No file selected');
      }
    } catch (e) {
      throw Exception('Failed to import database: $e');
    }
  }

  /// Gets statistics about the current database.
  ///
  /// Returns a map with table names and their record counts.
  /// Useful for displaying database status to users.
  static Future<Map<String, int>> getDatabaseStats() async {
    try {
      return await AppDatabase.instance.getDatabaseStats();
    } catch (e) {
      throw Exception('Failed to get database stats: $e');
    }
  }
}
