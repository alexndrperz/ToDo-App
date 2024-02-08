// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_demo/pages/to_do_page.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mainBox');
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textSelectionTheme: TextSelectionThemeData(
                selectionColor: Colors.blue,
                selectionHandleColor: Colors.blue)),
        debugShowCheckedModeBanner: false,
        home: ToDoPage());
  }
}
