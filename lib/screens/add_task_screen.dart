import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({@required this.addTaskCallback});

  final Function(String taskTitle) addTaskCallback;

  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'New Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextField(
                controller: _taskController,
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 48.0,
                child: RaisedButton(
                  onPressed: () => addTaskCallback(_taskController.text),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
