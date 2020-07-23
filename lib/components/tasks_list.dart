import 'package:flutter/material.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/utils/no_glow_behavior.dart';

class TasksList extends StatefulWidget {
  TasksList(this.tasks);

  final List<Task> tasks;

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    List<Task> tasks = widget.tasks;
    return ScrollConfiguration(
      behavior: NoGlowBehavior(),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (_, index) {
          return TaskTile(
            task: tasks[index],
            toggleCheckboxState: (checkboxState) {
              setState(() {
                tasks[index].handleDone(checkboxState);
              });
            },
          );
        },
      ),
    );
  }
}
