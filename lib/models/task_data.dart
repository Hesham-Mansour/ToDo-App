import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "Go Shoppng"),
    Task(name: "Play Football"),
    Task(name: "Read Book"),
  ];

  void addTask(newTaskTite) {
    tasks.add(Task(name: newTaskTite));
    notifyListeners();
  }

  void deletTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void updateStuta(Task task) {
    task.chandeStatu();
    notifyListeners();
  }

  int get count {
    return tasks.length;
  }
}
