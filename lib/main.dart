import 'package:blog_flutter_todo_list/screens/todo_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const TodoList(),
    );
  }
}


