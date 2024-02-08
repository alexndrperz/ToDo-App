import 'package:hive/hive.dart';

class AppDatabase {
  List toDoList = [];

  final _appBox = Hive.box('mainBox');

  void createInitialData() {
    toDoList = [
      ["Despertarse a las 6 AM", true],
      ["Beber 8 vasos de agua", false]
    ];
  }

  void loadData() {
    toDoList = _appBox.get("TODOLIST");
  }

  void updateDB() {
    _appBox.put("TODOLIST", toDoList);
  }
}
