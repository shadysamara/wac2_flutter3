import 'package:flutter/material.dart';
import 'package:wac2_flutter/todoApp/data/dummy_data.dart';
import 'package:wac2_flutter/todoApp/models/task_model.dart';
import 'package:wac2_flutter/todoApp/pages/all_tasks.dart';
import 'package:wac2_flutter/todoApp/pages/complete_tasks.dart';
import 'package:wac2_flutter/todoApp/pages/inComplete_tasks.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  deleteTask(Task task) {
    Data.tasks.remove(task);
    setState(() {});
  }

  updateTask(Task task) {
    task.isComplete = !task.isComplete;
    int index = Data.tasks.indexOf(task);
    Data.tasks[index] = task;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TODO APP'),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text('All Tasks'),
              ),
              Tab(
                child: Text('Complete Tasks'),
              ),
              Tab(
                child: Text('InComplete Tasks'),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          AllTasksPage(deleteTask, updateTask),
          CompleteTasksPage(deleteTask, updateTask),
          InCompleteTasksPage(deleteTask, updateTask)
        ]),
      ),
    );
  }
}
