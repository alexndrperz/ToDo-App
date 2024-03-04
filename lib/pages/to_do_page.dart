// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_demo/components/modal_box.dart';
import 'package:to_do_demo/components/to_do_item.dart';
import 'package:to_do_demo/data/database.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> with TickerProviderStateMixin {
  final _hivBox = Hive.box('mainBox');
  AppDatabase _db = AppDatabase();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    if (_hivBox.get("TODOLIST") == null) {
      _db.createInitialData();
    } else {
      _db.loadData();
    }
    super.initState();

    _controller.forward();
  }

  final _textController = TextEditingController();

  cleanScreen() {
    _textController.text = "";
    Navigator.of(context).pop();
  }

  saveTask() {
    setState(() {
      _db.toDoList.add([_textController.text, false]);
    });
    _db.updateDB();
    cleanScreen();
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return ModalBox(
            controller: _textController,
            onSave: saveTask,
            onCancel: cleanScreen,
          );
        });
  }

  void changeCheck(bool? value, int index) {
    setState(() {
      _db.toDoList[index][1] = !_db.toDoList[index][1];
    });
    _db.updateDB();
  }

  void deleteTask(int index) {
    setState(() {
      _db.toDoList.removeAt(index);
    });
    _db.updateDB();
  }

  @override
  void dispose() {
    _controller.dispose(); // Liberar recursos
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 255, 253),
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          elevation: 4.0,
          shadowColor: Colors.black,
          title: Text(
            "Mis tareas",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => createTask(),
          tooltip: "Añadir",
          backgroundColor: Color.fromARGB(255, 180, 207, 255),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Icon(
            Icons.format_list_bulleted_add,
            size: 30,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: FadeTransition(
            opacity: _animation,
            child: ListView.builder(
              itemCount: _db.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoItem(
                  itemName: _db.toDoList[index][0],
                  isComplete: _db.toDoList[index][1],
                  toogled: (value) => changeCheck(value, index),
                  delFunction: (context) => deleteTask(index),
                );
              },
            ),
          ),
        ));
  }
}
