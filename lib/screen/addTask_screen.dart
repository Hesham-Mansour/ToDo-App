// ignore_for_file: file_names, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constaint.dart';
import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? addTaskTitle;
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: greenColor),
          ),
          TextFormField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newVal) {
              addTaskTitle = newVal;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<TaskData>(
            builder: ((context, taskData, child) {
              return TextButton(
                onPressed: () {
                  taskData.addTask(addTaskTitle);
                  Navigator.of(context).pop();
                },
                child: const Text("Add"),
                style: TextButton.styleFrom(
                    backgroundColor: greenColor, primary: Colors.white),
              );
            }),
          )
        ],
      ),
    );
  }
}
