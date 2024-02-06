// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_demo/pages/to_do_page.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ToDoPage());
  }
}
