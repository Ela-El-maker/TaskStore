import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../models/taskModel.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() +
          "tasks.db"; // Added '/' before the file name
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("Creating a new one...");
          return db.execute(
            "CREATE TABLE $_tableName ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title STRING, note TEXT, date STRING,"
            "startTime STRING, endTime STRING,"
            "remind INTEGER,repeat STRING,"
            "color INTEGER,"
            "isCompleted INTEGER" // Removed trailing comma
            ")",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print("Insert function called");
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  // static Future<List<Task>> getAll() async {
  //   print("Query function called");
  //   List<Map<String, dynamic>> maps = await _db?.query(_tableName);
  //   return maps.map((map) => Task.fromJson(map)).toList();
  // }
  static Future<List<Map<String, dynamic>>> query() async {
    print("Query function called");
    return await _db!.query(_tableName);
  }

  static delete(Task task) async {
    int id = task.id!;
    print('Deleting $id');
    return await _db?.delete(_tableName, where: 'id=?', whereArgs: [id]);
  }
  // static Future<int> update(Task task) async {
  //   int id = task.id!;
  //   print('Updating $id');
  //   return await _db!.update(_tableName, task.toJson(),
  //       where: 'id=?', whereArgs: [id]);
  //       // where: 'id=?', whereArgs: [id]);

  // }
  static update(int id) async {
    return await _db?.rawUpdate('''
      UPDATE $_tableName SET isCompleted = ?
      WHERE id =?
      ''', [1, id]);

  }
}
