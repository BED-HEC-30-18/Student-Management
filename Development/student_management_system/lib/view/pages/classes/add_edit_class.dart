import 'package:flutter/material.dart';
import 'package:student_management_system/data/Operations/class_operations.dart';
import 'package:student_management_system/domain/models/class_model.dart';
import 'package:student_management_system/domain/models/subject_model.dart';
import 'package:student_management_system/view/core/components/input/dropDown.dart';
import 'package:student_management_system/view/core/components/input/inputField.dart';
import 'package:student_management_system/view/core/components/input/timeButton.dart';
import 'package:student_management_system/view/core/components/title/fieldTitle.dart';
import 'package:student_management_system/view/core/components/title/titleback.dart';

class AddEditClass extends StatefulWidget {
  Period? period;
  Subject? subject;
  final bool edit;
  AddEditClass({
    Key? key,
    this.period,
    this.subject,
    required this.edit,
  }) : super(key: key);

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
  List<String> types = [
    'Class',
    'Lab Work',
    'Practical Sessions',
    'Research',
  ];
  String? selectedDay = 'Monday';
  String? selectedType = 'Class';
  int startH = 8;
  int endH = 9;
  int startM = 0;
  int endM = 0;
  Subject? selectedSubject;
  final _locationController = TextEditingController();

  PeriodOperations periodOperations = PeriodOperations();

  int getDay(String index) {
    switch (selectedDay) {
      case "Monday":
        return 1;
      case "Tuesday":
        return 2;
      case "Wednesday":
        return 3;
      case "Thursday":
        return 4;
      case "Friday":
        return 5;
      case "Saturday":
        return 6;
      case "Sunday":
        return 7;
      default:
        return 1;
    }
  }

  String getDayNum(int index) {
    switch (widget.period!.day) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "Monday";
    }
  }

  void getTime(TimeOfDay start, TimeOfDay end) {
    startH = start.hour;
    startM = start.minute;
    endH = end.hour;
    endM = end.minute;
  }

  Widget DoneButton(TimeOfDay start, TimeOfDay end) {
    // final isFormValid = title.isNotEmpty && teacher.isNotEmpty;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.1,
      height: size.height * 0.06,
      child: IconButton(
        onPressed: () {
          int _day = getDay(selectedDay!);
          getTime(start, end);

          print(_locationController.text);
          print(selectedSubject!.title);
          print(_day);
          print("${startH} : ${startM} - ${endH} : ${endM} ");
          print(selectedType);

          if (widget.edit) {
            widget.period!.subject = selectedSubject!.id!;
            widget.period!.type = selectedType!;
            widget.period!.location = _locationController.text;
            widget.period!.day = _day;
            widget.period!.startH = startH;
            widget.period!.startM = startM;
            widget.period!.endH = endM;
            widget.period!.endM = endM;

            periodOperations.updatePeriod(widget.period!);
          } else {
            final period = Period(
              subject: selectedSubject!.id!,
              day: _day,
              type: selectedType!,
              location: _locationController.text,
              startH: startH,
              endH: endH,
              startM: startM,
              endM: endM,
            );

            periodOperations.createPeriod(period);
          }
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.done_all,
          size: 36,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // widget.edit
    //      _locationController.text = widget.period!.location
    //     : _locationController.text = "";
    // widget.edit
    //      selectedDay = getDayNum(widget.period!.day)
    //     : selectedDay = "Monday";
    // widget.edit
    //      selectedType = widget.period!.type
    //     : selectedType = "Assignment";
    // widget.edit ? startH = widget.period!.startH : startH = 0;
    // widget.edit ? startM = widget.period!.startM : startM = 0;
    // widget.edit ? endH = widget.period!.endH : endH = 0;
    // widget.edit ? endM = widget.period!.endM : endM = 0;
    // widget.edit
    //      selectedSubject = widget.subject
    //     : selectedSubject = Subject(title: "", color: 0, teacher: "");
    TimeOfDay start = TimeOfDay(hour: startH, minute: startM);
    TimeOfDay end = TimeOfDay(hour: endH, minute: endM);
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
                  DoneButton(start, end),
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
