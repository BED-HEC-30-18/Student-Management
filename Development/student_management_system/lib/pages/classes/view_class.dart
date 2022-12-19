import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/edit_button.dart';
import 'package:student_management_system/components/info_field.dart';
import 'package:student_management_system/components/title/titleback.dart';
import 'package:student_management_system/pages/classes/add_edit_class.dart';

class ViewClass extends StatelessWidget {
  const ViewClass({Key? key}) : super(key: key);

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
                BackTitle(title: "View Class"),
                EditButton(destination: AddEditClass())
              ],
            ),
            Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClassInfoField(
                    infofield: "Mobile Development",
                    color: Color.fromARGB(255, 26, 143, 227),
                  ),
                  IconInfoField(
                    icon: Icons.account_circle_rounded,
                    infofield: "Lab Session",
                  ),
                  IconInfoField(
                    icon: Icons.location_on,
                    infofield: "Computer Lab 1, Brown Chimpamba",
                  ),
                  IconInfoField(
                    icon: Icons.calendar_today,
                    infofield: "16/12/2022",
                  ),
                  IconInfoField(
                    icon: Icons.access_time,
                    infofield: "1:00 PM - 3:00 PM",
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
