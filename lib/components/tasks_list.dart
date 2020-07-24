import 'package:flutter/material.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/utils/no_glow_behavior.dart';

import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehavior(),
      child: Consumer<TaskData>(
        builder: (_, taskData, __) {
          return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (_, index) {
              return TaskTile(
                task: taskData.tasks[index],
                toggleCheckboxState: (checkboxState) {
                  // setState(() {
                  //   tasks[index].handleDone(checkboxState);
                  // });
                },
              );
            },
          );
        },
      ),
    );
  }
}
