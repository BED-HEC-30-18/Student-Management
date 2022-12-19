import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/delete_button.dart';
import 'package:student_management_system/components/button/edit_button.dart';
import 'package:student_management_system/components/info_field.dart';
import 'package:student_management_system/components/title/titleback.dart';
import 'package:student_management_system/pages/subjects/add_edit_subject.dart';

class ViewSubject extends StatefulWidget {
  const ViewSubject({Key? key}) : super(key: key);

  @override
  State<ViewSubject> createState() => _ViewSubjectState();
}

class _ViewSubjectState extends State<ViewSubject> {
  bool isTapped = false;

  void click() async {
    setState(() {
      isTapped = true;
    });
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      isTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackTitle(title: "View Subject"),
                EditButton(destination: AddEditSubject())
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                size.width * 0.05,
                0,
                size.width * 0.05,
                0,
              ),
              child: FittedBox(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 26, 143, 227),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text(
                      "Mobile Development",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            IconInfoField(
              icon: Icons.account_circle_rounded,
              infofield: "Isaac Mwakabira",
            ),
            GestureDetector(
              onTap: click,
              child: DeleteButton(isTapped: isTapped),
            ),
          ],
        ),
      ),
    );
  }
}
