import 'package:flutter/material.dart';

class Task {
  Task({@required this.title, this.isDone = false});

  final String title;
  bool isDone;

  void handleDone(bool newValue) {
    isDone = newValue;
  }
}