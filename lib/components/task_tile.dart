import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool task = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('This is a task'),
      trailing: Checkbox(
        value: task,
        onChanged: (value) {
          setState(() {
            task = value;
          });
        },
      ),
    );
  }
}
