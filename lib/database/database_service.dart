import 'package:salary_securitas/database/service_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Service responsible for opening and initializing the SQLite database.
///
/// Lazily initializes a single Database instance and delegates table creation
/// to ServiceDB during onCreate.
class DatabaseService {
  Database? _database;

  /// Returns the initialized database instance, creating it if necessary.
  /// @return Future<Database> the opened database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initialize();
    return _database!;
  }

  /// Return full file path for the database file.
  /// @return Future<String> full path to the DB file
  Future<String> get fullPath async {
    const name = 'service.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  /// Initialize the database (openDatabase).
  /// @return Future<Database> the created/opened Database
  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  /// Called when DB is created for the first time. Delegates to ServiceDB.
  /// @param database Database instance passed by sqflite
  /// @param version schema version
  /// @return Future<void>
  Future<void> create(Database database, int version) async {
    await ServiceDB().createTableService(database);
  }
}
