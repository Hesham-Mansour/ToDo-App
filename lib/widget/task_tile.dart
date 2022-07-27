// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/constaint.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool isCheck;
  final Function(bool?) changeStatu;
  final void Function() scrollDelet;
  final void Function(BuildContext?) deletTask;

  const TaskTile(
      {Key? key,
      required this.taskName,
      required this.isCheck,
      required this.changeStatu, required this.deletTask, required this.scrollDelet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
          motion: ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: scrollDelet),
          children: [
            SlidableAction(
              onPressed: deletTask,
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ]),
      child: ListTile(
        title: Text(
          taskName,
          style: TextStyle(
              decoration: isCheck ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            activeColor: greenColor, value: isCheck, onChanged: changeStatu),
        // onLongPress: onPress,
      ),
    );
  }
}
