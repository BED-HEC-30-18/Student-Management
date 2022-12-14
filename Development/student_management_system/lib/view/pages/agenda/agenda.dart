import 'package:flutter/material.dart';
import 'package:student_management_system/view/core/components/button/addButton.dart';
import 'package:student_management_system/view/core/components/title/titlebar.dart';
import 'package:student_management_system/view/pages/agenda/add_edit_event.dart';
import 'package:student_management_system/view/pages/agenda/calendar.dart';

// ignore: must_be_immutable
class CalendarPage extends StatelessWidget {
  CalendarPage({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isDrawerOpen
          ? MainSection(isDrawerOpen: isDrawerOpen)
          : SafeArea(
              child: MainSection(isDrawerOpen: isDrawerOpen),
            ),
      floatingActionButton: AddButton(
        destination: AddEditTask(
          edit: false,
        ),
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
