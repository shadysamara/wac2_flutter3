import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:wac2_flutter/database/task_db_model.dart';

class SqliteHelper {
  SqliteHelper._();
  static SqliteHelper sqliteHelper = SqliteHelper._();
  static final String tableName = 'tasks';
  static final String idColumnName = 'taskId';
  static final String taskNameColumnName = 'taskName';
  static final String taskIsCompleteColumnName = 'taskIsComplete';
  Database database;
  initDatabase() async {
    database = await createDatabase();
  }

  Future<Database> createDatabase() async {
    // 1- define database full path
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/tasks.db';
    // 2- make connection with database
    Database database = await openDatabase(path, version: 1, onCreate: (db, v) {
      // 3- creata table in database
      db.execute(
          'CREATE TABLE $tableName ($idColumnName INTEGER PRIMARY KEY AUTOINCREMENT, $taskNameColumnName TEXT, $taskIsCompleteColumnName INTEGER)');
    });
    return database;
  }

  insertNewTask(TaskDb taskDb) async {
    int rowIndex = await database.insert(tableName, taskDb.toMap());
    print(rowIndex);
  }

  getTasks() async {
    List<Map> result = await database.query(tableName);
    print(result);
  }

  getOneTask(int id) async {
    List<Map> result = await database.query(tableName, where: 'taskId=$id');
    print(result);
  }

  deleteTask(int id) async {
    int deletedRows = await database.delete(tableName);
    print(deletedRows);
  }

  updateTask(TaskDb taskDb) async {
    print(taskDb.isComplete);
//     database.rawUpdate('''UPDATE $tableName
// SET
//     $taskIsCompleteColumnName = ${taskDb.isComplete ? 1 : 0}
// WHERE
//     taskId = ${taskDb.id};''');
    database.update(tableName, taskDb.toMap(), where: 'taskId=${taskDb.id}');
  }
}
