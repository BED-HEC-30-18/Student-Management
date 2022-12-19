import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/edit_button.dart';
import 'package:student_management_system/components/info_field.dart';
import 'package:student_management_system/components/title/titleback.dart';
import 'package:student_management_system/pages/agenda/add_edit_event.dart';
import 'package:student_management_system/pages/subjects/add_edit_subject.dart';

class ViewTask extends StatelessWidget {
  const ViewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackTitle(title: "View Task"),
                EditButton(destination: AddEditTask())
              ],
            ),
            Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconInfoField(
                    icon: Icons.title,
                    infofield: "Practice design patterns",
                  ),
                  IconInfoField(
                    icon: Icons.co_present,
                    infofield: "Study",
                  ),
                  IconInfoField(
                    icon: Icons.calendar_today,
                    infofield: "16/12/2022",
                  ),
                  IconInfoField(
                    icon: Icons.repeat,
                    infofield: "weekly",
                  ),
                  IconInfoField(
                    icon: Icons.access_time_rounded,
                    infofield: "1:00 PM",
                  ),
                  IconInfoField(
                    icon: Icons.add_alert_rounded,
                    infofield: "1:00 PM",
                  ),
                  ClassInfoField(
                    infofield: "Mobile Development",
                    color: Color.fromARGB(255, 26, 143, 227),
                  ),
                  IconInfoField(
                    icon: Icons.note,
                    infofield:
                        "Need to study and practice the concepts learnt last we in class , to be well prepared for the lab",
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: size.width * 0.075),
                    width: size.width * 0.85,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(26, 207, 218, 227),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color.fromARGB(12, 0, 0, 0),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        IconInfoField(
                            infofield: "Subtask",
                            icon: Icons.subdirectory_arrow_right)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
