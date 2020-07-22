import 'package:flutter/material.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/utils/no_glow_behavior.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehavior(),
      child: ListView(
        children: <Widget>[
          TaskTile(),
          TaskTile(),
          TaskTile(),
        ],
      ),
    );
  }
}
