import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/addButton.dart';
import 'package:student_management_system/components/title/titlebar.dart';
import 'package:student_management_system/database/task_operations.dart';
import 'package:student_management_system/pages/agenda/add_edit_event.dart';
import 'package:student_management_system/pages/agenda/calendar.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isDrawerOpen
          ? MainSection(isDrawerOpen: isDrawerOpen)
          : SafeArea(
              child: MainSection(isDrawerOpen: isDrawerOpen),
            ),
      floatingActionButton: AddButton(
        destination: AddEditTask(),
      ),
    );
  }
}

class MainSection extends StatefulWidget {
  const MainSection({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  final bool isDrawerOpen;

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Calendar(),
        TitleBar(
          title: "Calendar",
          isDrawerOpen: widget.isDrawerOpen,
        ),
      ],
    );
  }
}
