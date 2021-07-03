import 'package:flutter/material.dart';
import 'package:wac2_flutter/database/sqlite_helper.dart';

class TaskDb {
  int id;
  String name;
  bool isComplete;
  TaskDb({
    @required this.id,
    @required this.name,
    @required this.isComplete,
  });
  toMap() {
    return {
      SqliteHelper.taskNameColumnName: this.name,
      SqliteHelper.taskIsCompleteColumnName: this.isComplete ? 1 : 0
    };
  }
}
