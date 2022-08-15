import 'package:flutter/material.dart';
import 'package:sqlite_database/read_todo_scren.dart';

class ReadTodoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateToReadTodoScreen(context);
      },
      child: Text("Read Todo"),
    );
  }

  _navigateToReadTodoScreen(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReadTodoScreen()),
    );
  }
}