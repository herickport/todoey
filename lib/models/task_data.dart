import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:todoey/models/task.dart';

import 'package:path_provider/path_provider.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  TaskData() {
    loadTaskData();
  }

  loadTaskData() async {
    await _readTaskData();

    notifyListeners();

    return _tasks;
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(String taskTitle) async {
    _tasks.add(Task(title: taskTitle));

    await saveTaskData();
  }

  void updateTask(Task task) async {
    task.toggleDone();

    await saveTaskData();
  }

  void deleteTask(Task task) async {
    _tasks.remove(task);

    await saveTaskData();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/todoey.txt');
  }

  Future<void> saveTaskData() async {
    await _writeTaskData();

    notifyListeners();
  }

  Future<File> _writeTaskData() async {
    final file = await _localFile;

    String content = jsonEncode(_tasks);

    return file.writeAsString('$content');
  }

  Future<void> _readTaskData() async {
    try {
      final file = await _localFile;

      String data = await file.readAsString();

      _tasks = (json.decode(data) as List)
          .map((data) => Task.fromJson(data))
          .toList();
    } catch (e) {
      print(e);
    }
  }
}
