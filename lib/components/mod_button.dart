// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ModButton extends StatelessWidget {
  final String title;
  VoidCallback pressed;
  ModButton({super.key, required this.title, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: pressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor:
                MaterialStateProperty.all<Color>(Colors.blueAccent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: 9, horizontal: 17))),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 227, 227, 227),
              fontWeight: FontWeight.w700),
        ));
  }
}
