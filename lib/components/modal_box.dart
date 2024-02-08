// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:to_do_demo/components/mod_button.dart';

class ModalBox extends StatelessWidget {
  ModalBox(
      {super.key,
      required this.onSave,
      required this.onCancel,
      required this.controller});

  VoidCallback onSave;
  VoidCallback onCancel;
  final controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Color.fromARGB(255, 195, 227, 253),
      content: SizedBox(
        height: 175,
        width: 400,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Añadir tarea",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 1, 33, 60),
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: onCancel,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 55, 99), width: 2.0)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(),
                    hintText: "Nueva tarea",
                    hintStyle: TextStyle(fontSize: 18)),
                cursorColor: Colors.blue,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ModButton(
                title: "Guardar",
                pressed: onSave,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
