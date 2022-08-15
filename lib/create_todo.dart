import 'package:flutter/material.dart';
import 'package:sqlite_database/create_todo_screen.dart';
import 'package:sqlite_database/read_todo_scren.dart';

class CreateTodoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateToCreateTodoScreen(context);
      },
      child: Text("Create Todo"),
    );
  }

  _navigateToCreateTodoScreen(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateTodoScreen()),
    );
  }
}