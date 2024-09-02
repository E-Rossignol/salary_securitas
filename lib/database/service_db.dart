import 'package:salary_securitas/constants/helper.dart';
import 'package:salary_securitas/models/appointment.dart';
import 'package:sqflite/sqflite.dart';
import 'database_service.dart';
import 'package:salary_securitas/models/service.dart';
import 'package:salary_securitas/models/user_secu.dart';

class ServiceDB {
  final tableNameService = 'services';
  final tableNameNames = 'names';

  Future<void> createTableService(Database db) async {
    await db.execute("""CREATE TABLE IF NOT EXISTS $tableNameService (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "start" INTEGER NOT NULL,
    "end" INTEGER NOT NULL,
    "isOrderService" INTEGER NOT NULL,
    "user" TEXT NOT NULL
    );""");
  }

  Future<void> createTableName(Database db) async {
    await db.execute("""CREATE TABLE IF NOT EXISTS $tableNameNames (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL
    );""");
  }

  Future<int> create(Appointment app) async {
    final db = await DatabaseService().database;
    Service data = Helper.toServiceList([app]).first;
    final Map<String, dynamic> serviceMap = {
      'start': data.start,
      'end': data.end,
      'isOrderService': data.isOrderService,
      'user': data.user,
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
            'user': user as String
          } in serviceMaps)
        Service(
            id: id,
            start: start,
            end: end,
            isOrderService: isOrderService,
            user: user),
    ];
    return Helper.toAppointmentList(all.toList());
  }

  Future<List<Appointment>>? fetchUserAppointments(String id) async {
    List<Appointment> all = await fetchAll();
    return all.where((element) => element.user == id).toList();
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
          'user': data.user,
        },
        where: 'id = ?',
        conflictAlgorithm: ConflictAlgorithm.rollback,
        whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await DatabaseService().database;
    return db.delete(tableNameService, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> createName(UserSecu user) async {
    Database db = await DatabaseService().database;
    final Map<String, dynamic> userSecuMap = {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
    };
    return await db.insert(tableNameNames, userSecuMap);
  }

  Future<int> updateName(UserSecu user) async {
    Database db = await DatabaseService().database;
    return await db.update(
        tableNameNames,
        {
          'id': user.id,
          'firstName': user.firstName,
          'lastName': user.lastName,
          'email': user.email,
        },
        where: 'email = ?',
        conflictAlgorithm: ConflictAlgorithm.rollback,
        whereArgs: [user.email]);
  }

  Future<List<UserSecu>> fetchAllNames() async {
    Database db = await DatabaseService().database;
    final List<Map<String, Object?>> nameMaps = await db.query(tableNameNames);
    List<UserSecu> all = [
      for (final {
            'id': id as int,
            'firstName': firstName as String,
            'lastName': lastName as String,
            'email': email as String
          } in nameMaps)
        UserSecu(id: id, email: email, firstName: firstName, lastName: lastName)
    ];
    return all;
  }

  Future<UserSecu> getName(String email) async {
    List<UserSecu> all = (await fetchAllNames())
        .where((element) => element.email == email)
        .toList();
    if (all.length == 1) {
      return all.first;
    } else {
      return UserSecu(id: -1, email: '', firstName: '', lastName: '');
    }
  }

  Future<bool> resetTables() async {
    Database db = await DatabaseService().database;
    await db.execute('DROP TABLE IF EXISTS $tableNameService');
    await db.execute('DROP TABLE IF EXISTS $tableNameNames');
    createTableName(db);
    createTableService(db);
    return true;
  }
}
