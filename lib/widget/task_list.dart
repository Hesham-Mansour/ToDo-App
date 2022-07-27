// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/widget/task_tile.dart';

import '../models/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList(this.tasks);
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
          itemCount: taskData.count,
          itemBuilder: (context, index) {
            return TaskTile(
              taskName: taskData.tasks[index].name,
              isCheck: taskData.tasks[index].ischeck,
              changeStatu: (check) {
                taskData.updateStuta(taskData.tasks[index]);
              },
              deletTask: (context) {
                taskData.deletTask(taskData.tasks[index]);
              },
              scrollDelet: () => taskData.deletTask(taskData.tasks[index]),
            );
          }),
    );
  }
}
