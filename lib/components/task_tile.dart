import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskTile extends StatelessWidget {
  TaskTile({@required this.task, this.toggleCheckboxState});

  final Task task;
  final void Function(bool checkboxState) toggleCheckboxState;

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
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: task.isDone,
        onChanged: toggleCheckboxState,
      ),
    );
  }
}
