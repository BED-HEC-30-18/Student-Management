import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/delete_button.dart';
import 'package:student_management_system/components/info_field.dart';
import 'package:student_management_system/components/title/titleback.dart';
import 'package:student_management_system/database/subject_operations.dart';
import 'package:student_management_system/models/subject_model.dart';
import 'package:student_management_system/pages/subjects/add_edit_subject.dart';

class ViewSubject extends StatefulWidget {
  Subject subject;
  ViewSubject({Key? key, required this.subject}) : super(key: key);

  @override
  State<ViewSubject> createState() => _ViewSubjectState();
}

class _ViewSubjectState extends State<ViewSubject> {
  bool isTapped = false;
  bool isLoading = false;

  SubjectOperations subjectOperations = SubjectOperations();

  void click() async {
    setState(() {
      isTapped = true;
    });
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      isTapped = false;
    });
    subjectOperations.deleteSubject(widget.subject);
    Navigator.pop(context);
  }

  Widget EditButton() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.1,
      margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.05, 0),
      child: IconButton(
        onPressed: (() =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddEditSubject(
                subject: widget.subject,
                edit: true,
              );
            }))),
        icon: const Icon(
          Icons.edit,
          size: 36,
        ),
      ),
    );
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
                EditButton(),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color(widget.subject.color),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        widget.subject.title,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
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
              infofield: widget.subject.teacher,
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
