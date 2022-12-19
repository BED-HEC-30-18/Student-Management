import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/done_button.dart';
import 'package:student_management_system/components/title/titleback.dart';

class AddEditTask extends StatelessWidget {
  const AddEditTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, size.width * 0.05, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BackTitle(title: "Add Task"),
                  DoneButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
