import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/addButton.dart';
import 'package:student_management_system/components/title/titlebar.dart';
import 'package:student_management_system/pages/classes/add_edit_class.dart';
import 'package:student_management_system/pages/classes/timetable.dart';

class TimetablePage extends StatelessWidget {
  TimetablePage({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   width: 80,
          //   height: size.height,
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).scaffoldBackgroundColor,
          //     border: Border.all(
          //       color: const Color.fromARGB(127, 225, 232, 231),
          //       width: 1.5,
          //     ),
          //   ),
          // ),
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: size.width,
            height: isDrawerOpen ? 80 : 140,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 229, 237, 236),
                  spreadRadius: 0,
                  blurRadius: 50,
                  offset: Offset(0.0, 20.0),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: size.width,
            height: size.height,
            alignment: Alignment.bottomRight,
            child: Container(
              width: size.width,
              height: isDrawerOpen ? size.height - 80 : size.height - 140,
              color: Color.fromARGB(255, 232, 240, 239),
              child: Timetable(),
            ),
          ),
          isDrawerOpen
              ? MainSection(isDrawerOpen: isDrawerOpen)
              : SafeArea(
                  child: MainSection(isDrawerOpen: isDrawerOpen),
                ),
        ],
      ),
      floatingActionButton: AddButton(
        destination: AddEditClass(),
      ),
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TitleBar(
        title: "Timetable",
        isDrawerOpen: isDrawerOpen,
      ),
    );
  }
}
