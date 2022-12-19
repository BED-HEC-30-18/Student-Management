import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/addButton.dart';
import 'package:student_management_system/components/title/titlebar.dart';
import 'package:student_management_system/pages/agenda/add_edit_event.dart';
import 'package:student_management_system/pages/agenda/calendar.dart';
import 'package:student_management_system/pages/agenda/event_card.dart';
import 'package:table_calendar/table_calendar.dart';

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
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
              width: size.width,
              height: size.height * 0.45,
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
              child: Calendar(),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            EventCard(
              subject: "Mobile Development",
              study: "Lab session",
              time: "1:00 PM : 3:00PM",
              icon: Icons.computer,
              color: Color.fromARGB(255, 26, 143, 227),
            )
          ],
        ),
        TitleBar(
          title: "Calendar",
          isDrawerOpen: widget.isDrawerOpen,
        ),
      ],
    );
  }
}
