import 'package:flutter/material.dart';
import 'package:wac2_flutter/database/sqlite_helper.dart';
import 'package:wac2_flutter/database/task_db_model.dart';

class DatabaseUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Test'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await SqliteHelper.sqliteHelper
                  .updateTask(TaskDb(id: 5, isComplete: true));
              // SqliteHelper.sqliteHelper.deleteTask(2);
              // SqliteHelper.sqliteHelper.getOneTask(2);
              SqliteHelper.sqliteHelper.getTasks();
              // SqliteHelper.sqliteHelper.insertNewTask(
              //     TaskDb(name: 'playing football', isComplete: false));
            },
            child: Text('Insert In Database')),
      ),
    );
  }
}
