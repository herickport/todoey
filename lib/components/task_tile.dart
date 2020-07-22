import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('This is a task'),
      trailing: Icon(Icons.check_box_outline_blank),
    );
  }
}
