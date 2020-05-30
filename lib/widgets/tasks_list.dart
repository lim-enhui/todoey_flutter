import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';
import 'package:todoeyflutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            longPressCallback: () {
              taskData.deleteTask(task);
            },
            checkboxCallback: (bool checkboxState) {
              taskData.updateTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
