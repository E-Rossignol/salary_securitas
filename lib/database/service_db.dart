import 'package:salary_securitas/constants/helper.dart';
import 'package:salary_securitas/models/appointment.dart';
import 'package:sqflite/sqflite.dart';
import 'database_service.dart';
import 'package:salary_securitas/models/service.dart';
class ServiceDB {
  final tableNameService = 'services';

  Future<void> createTableService(Database db) async {
    await db.execute("""CREATE TABLE IF NOT EXISTS $tableNameService (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "start" INTEGER NOT NULL,
    "end" INTEGER NOT NULL,
    "isOrderService" INTEGER NOT NULL
    );""");
  }

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

  Future<List<Appointment>> fetchAll() async {
    final db = await DatabaseService().database;
    final List<Map<String, Object?>> serviceMaps =
        await db.query(tableNameService);
    List<Service> all = [
      for (final {
            'id': id as int,
            'start': start as int,
            'end': end as int,
            'isOrderService': isOrderService as int,
          } in serviceMaps)
        Service(
            id: id,
            start: start,
            end: end,
            isOrderService: isOrderService),
    ];
    return Helper.toAppointmentList(all.toList());
  }

  Future<List<Appointment>>? fetchUserAppointments() async {
    List<Appointment> all = await fetchAll();
    return all;
  }

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
        whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await DatabaseService().database;
    return db.delete(tableNameService, where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> resetTables() async {
    Database db = await DatabaseService().database;
    await db.execute('DROP TABLE IF EXISTS $tableNameService');
    createTableService(db);
    return true;
  }
}
