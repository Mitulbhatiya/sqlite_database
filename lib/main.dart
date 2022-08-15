import 'package:flutter/material.dart';
import 'package:sqlite_database/homescreen.dart';
import 'package:sqlite_database/todo.dart';

import 'create_todo.dart';
import 'database_helper.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}



