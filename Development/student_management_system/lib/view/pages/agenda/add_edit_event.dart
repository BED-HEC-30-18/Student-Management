import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_management_system/data/Operations/task_operations.dart';
// import 'package:student_management_system/components/button/done_button.dart';
import 'package:student_management_system/domain/models/subject_model.dart';
import 'package:student_management_system/domain/models/task_model.dart';
import 'package:student_management_system/view/core/components/input/dateButton.dart';
import 'package:student_management_system/view/core/components/input/dropDown.dart';
import 'package:student_management_system/view/core/components/input/inputField.dart';
import 'package:student_management_system/view/core/components/input/timeButton.dart';
import 'package:student_management_system/view/core/components/title/fieldTitle.dart';
import 'package:student_management_system/view/core/components/title/titleback.dart';

class AddEditTask extends StatefulWidget {
  Task? task;
  Subject? subject;
  final bool edit;
  AddEditTask({
    Key? key,
    this.task,
    this.subject,
    required this.edit,
  }) : super(key: key);

  @override
  State<AddEditTask> createState() => _AddEditTaskState();
}

class _AddEditTaskState extends State<AddEditTask> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();
  Subject? selectedSubject;
  List<String> types = [
    'Assignment',
    'Study',
    'Practice',
    'Research',
    'Test',
    'Discussions'
  ];
  // String? selectedDay = 'Monday';
  String? selectedType = 'Assignment';
  TimeOfDay tyme = TimeOfDay(hour: 9, minute: 30);
  DateTime _date = DateTime.now();

  TaskOperations taskOperations = TaskOperations();

  Widget DoneButton() {
    // final isFormValid = title.isNotEmpty && teacher.isNotEmpty;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.1,
      height: size.height * 0.06,
      child: IconButton(
        onPressed: () {
          print(_titleController.text);
          print(selectedSubject!.title);
          print('${_date.day}/${_date.month}/${_date.year}');
          print(tyme.format(context).toString());
          print(_noteController.text);
          print(selectedType);

          if (widget.edit) {
            widget.task!.title = _titleController.text;
            widget.task!.subject = selectedSubject!.id!;
            widget.task!.type = selectedType!;
            widget.task!.note = _noteController.text;
            widget.task!.time = DateTime(
                _date.year, _date.month, _date.day, tyme.hour, tyme.minute);
            widget.task!.date = _date;
            widget.task!.repeat = "later";
            widget.task!.notification = "later";
            widget.task!.grade = 0;
            widget.task!.weight = 0;

            taskOperations.updateTask(widget.task!);
          } else {
            final task = Task(
              title: _titleController.text,
              subject: selectedSubject!.id!,
              type: selectedType!,
              note: _noteController.text,
              time: DateTime(
                  _date.year, _date.month, _date.day, tyme.hour, tyme.minute),
              date: _date,
              repeat: "later",
              notification: "later",
              grade: 0,
              weight: 0,
            );

            taskOperations.createTask(task);
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
    widget.edit
        ? _titleController.text = widget.task!.title
        : _titleController.text = "";
    widget.edit
        ? _noteController.text = widget.task!.note
        : _noteController.text = "";
    widget.edit
        ? selectedType = widget.task!.type
        : selectedType = "Assignment";
    widget.edit
        ? tyme = TimeOfDay(
            hour: int.parse(DateFormat.H().format(widget.task!.time)),
            minute: int.parse(DateFormat.m().format(widget.task!.time)))
        : tyme = TimeOfDay(hour: 9, minute: 30);
    ;
    widget.edit ? _date = widget.task!.date : _date = DateTime.now();
    widget.edit
        ? selectedSubject = widget.subject
        : selectedSubject = Subject(title: "", color: 0, teacher: "");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              Column(
                children: [
                  fieldTitle(title: "Title"),
                  RoundInputField(
                    hintText: "Paper",
                    // onChanged: (value) {},
                    icon: Icons.person,
                    controller: _titleController,
                  ),
                ],
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
              DateButton(
                date: _date,
                title: 'Date',
                callback: (val) => setState(() => _date = val),
              ),
              TimeButton(
                time: tyme,
                title: 'Time',
                callback: (val) => setState(() => tyme = val),
              ),
              Column(
                children: [
                  fieldTitle(title: "Note"),
                  RoundInputField(
                    hintText: "e.g. The Great Hall",
                    // onChanged: (value) {},
                    icon: Icons.person,
                    controller: _noteController,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
