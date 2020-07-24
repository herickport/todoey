import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    @required this.task,
    this.toggleCheckboxState,
    this.deleteTaskCallback,
  });

  final Task task;
  final void Function(bool checkboxState) toggleCheckboxState;
  final void Function() deleteTaskCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        task.title,
        style: TextStyle(
          decoration:
              task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      onLongPress: deleteTaskCallback,
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: task.isDone,
        onChanged: toggleCheckboxState,
      ),
    );
  }
}
