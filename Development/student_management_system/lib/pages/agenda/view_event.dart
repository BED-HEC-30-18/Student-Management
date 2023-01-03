import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_management_system/components/info_field.dart';
import 'package:student_management_system/components/title/titleback.dart';
import 'package:student_management_system/database/task_operations.dart';
import 'package:student_management_system/models/subject_model.dart';
import 'package:student_management_system/models/task_model.dart';
import 'package:student_management_system/pages/agenda/add_edit_event.dart';

class ViewTask extends StatefulWidget {
  Task task;
  ViewTask({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  bool isTapped = false;
  bool isLoading = false;

  TaskOperations taskOperations = TaskOperations();

  void click() async {
    setState(() {
      isTapped = true;
    });
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      isTapped = false;
    });
    taskOperations.deleteTask(widget.task);
    Navigator.pop(context);
  }

  Widget EditButton() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.1,
      margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.05, 0),
      child: IconButton(
        onPressed: (() => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return AddEditTask();
              }),
            )),
        icon: const Icon(
          Icons.edit,
          size: 36,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Subject subject = taskOperations.getSubject(widget.task);
    final time = DateFormat.Hm().format(widget.task.time);
    final date = DateFormat.yMMMd().format(widget.task.date);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackTitle(title: "View Task"),
                EditButton(),
              ],
            ),
            Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconInfoField(
                    icon: Icons.title,
                    infofield: widget.task.title,
                  ),
                  IconInfoField(
                    icon: Icons.co_present,
                    infofield: widget.task.type,
                  ),
                  IconInfoField(
                    icon: Icons.calendar_today,
                    infofield: date,
                  ),
                  // IconInfoField(
                  //   icon: Icons.repeat,
                  //   infofield: "weekly",
                  // ),
                  IconInfoField(
                    icon: Icons.access_time_rounded,
                    infofield: time,
                  ),
                  // IconInfoField(
                  //   icon: Icons.add_alert_rounded,
                  //   infofield: "1:00 PM",
                  // ),
                  ClassInfoField(
                    infofield: "${subject.title}",
                    color: Color(subject.color),
                  ),
                  IconInfoField(
                    icon: Icons.note,
                    infofield: widget.task.note,
                  ),
                  // Container(
                  //   margin:
                  //       EdgeInsets.symmetric(horizontal: size.width * 0.075),
                  //   width: size.width * 0.85,
                  //   height: 150,
                  //   decoration: BoxDecoration(
                  //     color: Color.fromARGB(26, 207, 218, 227),
                  //     borderRadius: BorderRadius.circular(5),
                  //     border: Border.all(
                  //       color: Color.fromARGB(12, 0, 0, 0),
                  //       width: 1.5,
                  //     ),
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       IconInfoField(
                  //           infofield: "Subtask",
                  //           icon: Icons.subdirectory_arrow_right)
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
