import 'package:flutter/material.dart';
import 'package:student_management_system/components/input/inputField.dart';
import 'package:student_management_system/components/title/fieldTitle.dart';
import 'package:student_management_system/components/title/titleback.dart';
import 'package:student_management_system/database/subject_operations.dart';
import 'package:student_management_system/models/subject_model.dart';

class AddEditSubject extends StatefulWidget {
  Subject? subject;
  final bool edit;
  AddEditSubject({
    Key? key,
    this.subject,
    required this.edit,
  }) : super(key: key);

  @override
  State<AddEditSubject> createState() => _AddEditSubjectState();
}

class _AddEditSubjectState extends State<AddEditSubject> {
  final _titleController = TextEditingController();
  final _teacherController = TextEditingController();
  int _colorController = Color.fromARGB(255, 26, 143, 227).value;

  // final _formKey = GlobalKey<FormState>();
  // late String title;
  // late int color;
  // late String teacher;

  // @override
  // void initState() {
  //   super.initState();

  //   title = widget.subject?.title ?? '';
  //   color = widget.subject?.color ?? 0;
  //   teacher = widget.subject?.teacher ?? '';
  // }

  SubjectOperations subjectOperations = SubjectOperations();

  Widget DoneButton() {
    // final isFormValid = title.isNotEmpty && teacher.isNotEmpty;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.1,
      height: size.height * 0.06,
      child: IconButton(
        onPressed: () {
          print(_colorController);
          print(_titleController.text);
          print(_teacherController.text);
          if (widget.edit) {
            widget.subject!.color = _colorController;
            widget.subject!.title = _titleController.text;
            widget.subject!.teacher = _teacherController.text;

            // subjectOperations.updateSubject(widget.subject!);
          } else {
            final subject = Subject(
              color: _colorController,
              title: _titleController.text,
              teacher: _teacherController.text,
            );

            // subjectOperations.createSubject(subject);
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
    final FocusNode subjectFocusNode = FocusNode();
    final FocusNode teacherFocusNode = FocusNode();
    Size size = MediaQuery.of(context).size;
    int colorA = Color.fromARGB(255, 113, 191, 71).value;
    int colorB = Color.fromARGB(255, 243, 121, 51).value;
    int colorC = Color.fromARGB(255, 209, 17, 73).value;
    int colorD = Color.fromARGB(255, 230, 194, 41).value;
    int colorE = Color.fromARGB(255, 102, 16, 242).value;
    widget.edit
        ? _titleController.text = widget.subject!.title
        : _titleController.text = "";
    widget.edit
        ? _teacherController.text = widget.subject!.teacher
        : _teacherController.text = "";
    widget.edit
        ? _colorController = widget.subject!.color
        : _colorController = 0;

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
                    BackTitle(title: "Add Subject"),
                    DoneButton(),
                  ],
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      fieldTitle(title: "Title"),
                      RoundInputField(
                        hintText: "e.g. Mathematics",
                        // onChanged: (value) {},
                        icon: Icons.school,
                        controller: _titleController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      fieldTitle(title: "Teacher"),
                      RoundInputField(
                        hintText: "e.g. Mr Joseph Banda",
                        // onChanged: (value) {},
                        icon: Icons.person,
                        controller: _teacherController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      fieldTitle(title: "Color"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                            vertical: size.height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  print(_colorController);
                                  _colorController = colorA;
                                  print(_colorController);
                                });
                              }),
                              child: ColorPick(
                                c_id: 1,
                                color: Color(colorA),
                                picked: _colorController,
                              ),
                            ),
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  _colorController = colorB;
                                  print(_colorController);
                                });
                              }),
                              child: ColorPick(
                                c_id: 2,
                                color: Color(colorB),
                                picked: _colorController,
                              ),
                            ),
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  _colorController = colorC;
                                  print(_colorController);
                                });
                              }),
                              child: ColorPick(
                                c_id: 3,
                                color: Color(colorC),
                                picked: _colorController,
                              ),
                            ),
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  _colorController = colorD;
                                  print(_colorController);
                                });
                              }),
                              child: ColorPick(
                                c_id: 4,
                                color: Color(colorD),
                                picked: _colorController,
                              ),
                            ),
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  _colorController = colorE;
                                  print(_colorController);
                                });
                              }),
                              child: ColorPick(
                                c_id: 5,
                                color: Color(colorE),
                                picked: _colorController,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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

class FormSubject extends StatelessWidget {
  const FormSubject({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class ColorPick extends StatelessWidget {
  const ColorPick({
    Key? key,
    required this.picked,
    required this.c_id,
    required this.color,
  }) : super(key: key);

  final int picked;
  final int c_id;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        border: Border.all(
          color: (picked == color)
              ? Color.fromARGB(255, 88, 5, 5)
              : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: color,
            spreadRadius: 0,
            blurRadius: 100,
            offset: Offset(5.0, 5.0),
          ),
        ],
      ),
    );
  }
}
