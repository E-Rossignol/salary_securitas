import 'package:salary_securitas/constants/helper.dart';
import 'package:salary_securitas/models/appointment.dart';
import 'package:sqflite/sqflite.dart';
import 'database_service.dart';
import 'package:salary_securitas/models/service.dart';

/// Data access object for services table.
///
/// Provides CRUD operations and table (re)creation/reset.
class ServiceDB {
  final tableNameService = 'services';

  /// Create the services table if it does not exist.
  /// @param db the Database in which to create the table
  /// @return Future<void>
  Future<void> createTableService(Database db) async {
    await db.execute("""CREATE TABLE IF NOT EXISTS $tableNameService (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "start" INTEGER NOT NULL,
    "end" INTEGER NOT NULL,
    "isOrderService" INTEGER NOT NULL
    );""");
  }

  /// Insert an [app] into the services table and return the inserted row id.
  /// @param app Appointment to insert
  /// @return Future<int> row id of the inserted record
  Future<int> create(Appointment app) async {
    final db = await DatabaseService().database;
    Service data = Helper.toServiceList([app]).first;
    final Map<String, dynamic> serviceMap = {
      'start': data.start,
      'end': data.end,
      'isOrderService': data.isOrderService,
    };
    return await db.insert(tableNameService, serviceMap);
  }

  /// Fetch all entries and convert them to a list of [Appointment].
  /// @return Future<List<Appointment>> list of appointments converted from DB rows
  Future<List<Appointment>> fetchAll() async {
    final db = await DatabaseService().database;
    final List<Map<String, Object?>> serviceMaps = await db.query(
      tableNameService,
    );
    // Map raw DB rows to Service model using pattern matching as before.
    List<Service> all = [
      for (final {
            'id': id as int,
            'start': start as int,
            'end': end as int,
            'isOrderService': isOrderService as int,
          }
          in serviceMaps)
        Service(id: id, start: start, end: end, isOrderService: isOrderService),
    ];
    return Helper.toAppointmentList(all.toList());
  }

  /// Wrapper returning all user appointments.
  /// @return Future<List<Appointment>>? nullable future list of appointments
  Future<List<Appointment>>? fetchUserAppointments() async {
    List<Appointment> all = await fetchAll();
    return all;
  }

  /// Update appointment row with [id] using values from [app].
  /// @param id database id to update
  /// @param app Appointment containing new values
  /// @return Future<int> number of affected rows
  Future<int> update(int id, Appointment app) async {
    final db = await DatabaseService().database;
    Service data = Helper.toServiceList([app]).first;
    return await db.update(
      tableNameService,
      {
        'id': data.id,
        'start': data.start,
        'end': data.end,
        'isOrderService': data.isOrderService,
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id],
    );
  }

  /// Delete row by [id].
  /// @param id database id to delete
  /// @return Future<int> number of deleted rows
  Future<int> delete(int id) async {
    Database db = await DatabaseService().database;
    return db.delete(tableNameService, where: 'id = ?', whereArgs: [id]);
  }

  /// Drop and recreate the services table.
  /// @return Future<bool> true when reset completed
  Future<bool> resetTables() async {
    Database db = await DatabaseService().database;
    await db.execute('DROP TABLE IF EXISTS $tableNameService');
    createTableService(db);
    return true;
  }
}
