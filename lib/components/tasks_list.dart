import 'package:flutter/material.dart';
import 'package:todoey/components/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: EdgeInsets.symmetric(
      //   horizontal: 32.0,
      //   vertical: 16.0,
      // ),
      children: <Widget>[
        TaskTile(),
        TaskTile(),
        TaskTile(),
      ],
    );
  }
}
