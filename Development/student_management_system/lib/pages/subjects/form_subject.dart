import 'package:flutter/material.dart';
import 'package:student_management_system/components/input/inputField.dart';
import 'package:student_management_system/components/title/fieldTitle.dart';

class FormSubject extends StatelessWidget {
  final String? title;
  final int? color;
  final String? teacher;
  final ValueChanged<int> onChangedColor;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedTeacher;

  const FormSubject({
    Key? key,
    this.title = '',
    this.color = 0,
    this.teacher = '',
    required this.onChangedColor,
    required this.onChangedTitle,
    required this.onChangedTeacher,
  }) : super(key: key);

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

    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              fieldTitle(title: "Title"),
              RoundInputField(
                hintText: "e.g. Mathematics",
                // onChanged: (value) {},
                icon: Icons.school,
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
                      child: ColorPick(c_id: 1, color: Color(colorA)),
                    ),
                    ColorPick(
                      c_id: 2,
                      color: Color(colorB),
                    ),
                    ColorPick(
                      c_id: 3,
                      color: Color(colorC),
                    ),
                    ColorPick(
                      c_id: 4,
                      color: Color(colorD),
                    ),
                    ColorPick(
                      c_id: 5,
                      color: Color(colorE),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ColorPick extends StatelessWidget {
  const ColorPick({
    Key? key,
    required this.c_id,
    required this.color,
  }) : super(key: key);

  final int c_id;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {}),
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: color,
              spreadRadius: 0,
              blurRadius: 100,
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
      ),
    );
  }
}
