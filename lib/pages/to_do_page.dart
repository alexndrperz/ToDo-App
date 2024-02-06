// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // Variable
  int _counter = 0;

  //Method
  void _incrementCount() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Has clickeado el boton este numero de veces"),
            Text(
              _counter.toString(),
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCount,
        child: Icon(Icons.add),
      ),
    );
  }
}
