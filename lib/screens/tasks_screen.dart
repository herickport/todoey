import 'package:flutter/material.dart';
import 'package:todoey/components/tasks_list.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/models/task_data.dart';

import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: TaskData().loadTaskData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          } else {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 32.0,
                      top: 16.0,
                      bottom: 24.0,
                      right: 32.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 16.0),
                            const Text(
                              'Todoey',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${context.watch<TaskData>().taskCount} tasks',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => AddTaskScreen(),
                            );
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                      child: TasksList(),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
