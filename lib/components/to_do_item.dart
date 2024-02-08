// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoItem extends StatelessWidget {
  ToDoItem(
      {super.key,
      required this.itemName,
      required this.isComplete,
      required this.toogled,
      required this.delFunction});

  String itemName = "";
  bool isComplete = false;
  Function(bool?)? toogled;
  Function(BuildContext)? delFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: delFunction,
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 249, 112, 102),
              borderRadius: BorderRadius.circular(5.0),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
              color: Colors.blue[200], borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Checkbox(
                value: isComplete,
                onChanged: toogled,
                activeColor: Colors.blue,
              ),
              Text(
                itemName,
                style: TextStyle(
                    decoration: isComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 19,
                    color: Color.fromARGB(255, 0, 29, 53)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
