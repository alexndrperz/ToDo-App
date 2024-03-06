// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoItem extends StatelessWidget {
  ToDoItem(
      {super.key,
      required this.itemName,
      required this.isComplete,
      required this.toogled,
      required this.delFunction,
      required this.index,
      required this.startAnimation});

  int index = 0;
  String itemName = "";
  bool isComplete = false;
  bool startAnimation;
  Function(bool?)? toogled;
  Function(BuildContext)? delFunction;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform: Matrix4.translationValues(0, startAnimation ? 0 : 60, 0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
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
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(10)),
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
      ),
    );
  }
}
