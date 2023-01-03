import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/done_button.dart';
import 'package:student_management_system/components/input/dropDown.dart';
import 'package:student_management_system/components/input/inputField.dart';
import 'package:student_management_system/components/input/timeButton.dart';
import 'package:student_management_system/components/title/titleback.dart';
import 'package:student_management_system/components/title/fieldTitle.dart';
import 'package:student_management_system/models/subject_model.dart';

class AddEditClass extends StatefulWidget {
  const AddEditClass({Key? key}) : super(key: key);

  @override
  State<AddEditClass> createState() => _AddEditClassState();
}

class _AddEditClassState extends State<AddEditClass> {
  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  List<String> types = ['Class', 'Lab Work', 'Practical Sessions', 'Research'];
  String? selectedDay = 'Monday';
  String? selectedType = 'Class';
  TimeOfDay start = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay end = TimeOfDay(hour: 9, minute: 30);
  Subject? selectedSubject;

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
                  BackTitle(title: "Add Class"),
                  DoneButton(),
                ],
              ),
            ),
            SubjectDrop(
              callback: (val) => setState(() => selectedSubject = val),
            ),
            DropDownMenu(
              selected: selectedType,
              selection: types,
              title: 'Type',
              hint: 'Pick the class select',
              callback: (val) => setState(() => selectedType = val),
            ),
            Column(
              children: [
                fieldTitle(title: "Location"),
                RoundInputField(
                  hintText: "e.g. The Great Hall",
                  // onChanged: (value) {},
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            DropDownMenu(
              selected: selectedDay,
              selection: days,
              title: 'Day',
              hint: 'Pick the day',
              callback: (val) => setState(() => selectedDay = val),
            ),
            TimeButton(
              time: start,
              title: 'Start',
              callback: (val) => setState(() => start = val),
            ),
            TimeButton(
              time: end,
              title: 'End',
              callback: (val) => setState(() => end = val),
            )
          ],
        ),
      ),
    );
  }
}
