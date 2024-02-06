// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_print

import 'dart:math';

import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  TextEditingController _controller = TextEditingController();

  String _msg = "";

  void saludar() {
    setState(() {
      _msg = "Hola ${_controller.text}!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _msg,
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Ingrese su nombre"),
                ),
              ),
              ElevatedButton(onPressed: saludar, child: Text("Enviar"))
            ],
          ),
        ),
      ),
    );
  }
}
