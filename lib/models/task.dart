import 'package:flutter/material.dart';

class Task {
  Task({@required this.title, this.isDone = false});

  final String title;
  bool isDone;

  Map toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] as String,
      isDone: json['isDone'] as bool,
    );
  }

  void toggleDone() {
    isDone = !isDone;
  }
}
