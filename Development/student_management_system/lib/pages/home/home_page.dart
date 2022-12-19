import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:like_button/like_button.dart';
import 'package:student_management_system/components/button/barButton.dart';
import 'package:student_management_system/components/info_field.dart';
import 'package:student_management_system/components/title/titlebar.dart';
import 'package:student_management_system/pages/agenda/task_card.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  bool isDrawerOpen;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final isDailOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (isDailOpen.value) {
          isDailOpen.value = false;

          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (() {}),
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(78, 2, 133, 227),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(10.0, 10.0),
                ),
              ],
            ),
            child: SpeedDial(
              animatedIcon: AnimatedIcons.add_event,
              animatedIconTheme: IconThemeData(
                size: 36,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              foregroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor: Theme.of(context).primaryColor,
              buttonSize: const Size(72.0, 72.0),
              childrenButtonSize: const Size(48.0, 48.0),
              spacing: 8,
              spaceBetweenChildren: 12,
              openCloseDial: isDailOpen,
              overlayOpacity: 0.2,
              overlayColor: Color.fromARGB(255, 3, 14, 23),
              children: [
                SpeedDialChild(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: FloatingActionButtonChild(
                    icon: Icons.create_rounded,
                  ),
                  label: "Test",
                ),
                SpeedDialChild(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: FloatingActionButtonChild(
                      icon: Icons.feed,
                    ),
                    label: "Homework"),
                SpeedDialChild(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: FloatingActionButtonChild(
                      icon: Icons.create_rounded,
                    ),
                    label: "Task"),
                SpeedDialChild(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: FloatingActionButtonChild(
                      icon: Icons.percent_rounded,
                    ),
                    label: "Grade"),
              ],
            ),
          ),
        ),
        body: widget.isDrawerOpen
            ? MainSection(
                widget: widget,
              )
            : SafeArea(
                child: MainSection(
                  widget: widget,
                ),
              ),
      ),
    );
  }
}

class MainSection extends StatefulWidget {
  const MainSection({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  final user = FirebaseAuth.instance.currentUser!;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TitleBar(
          title: "Hi, " + user.email!,
          isDrawerOpen: widget.widget.isDrawerOpen,
        ),
        Container(
          width: size.width * 0.95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "You've ",
                    ),
                    Text(
                      "6",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      " events on this day",
                    ),
                  ],
                ),
              ),
              TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime(1990),
                lastDay: DateTime(2050),
                calendarFormat: CalendarFormat.week,
                startingDayOfWeek: StartingDayOfWeek.monday,

                //Day changed
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  defaultTextStyle: const TextStyle(color: Colors.black),
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.blue),
                  todayDecoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  todayTextStyle: const TextStyle(color: Colors.black),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(color: Colors.black),
                  formatButtonTextStyle: TextStyle(color: Colors.black),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Subtitle(
          title: "Tasks ",
        ),
        Container(
          height: 166,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              TaskCard(),
              TaskCard(),
              TaskCard(),
              TaskCard(),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Subtitle(
          title: "Classes ",
        ),
        Container(
          height: 166,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              TaskCard(),
              TaskCard(),
              TaskCard(),
              TaskCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class Subtitle extends StatelessWidget {
  const Subtitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
      child: Row(
        children: [
          Text(
            "Tasks ",
          ),
          Text(
            "6",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class FloatingActionButtonChild extends StatelessWidget {
  const FloatingActionButtonChild({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(51, 239, 247, 246),
            spreadRadius: 0,
            blurRadius: 40,
            offset: Offset(-5.0, -5.0),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(26, 26, 143, 227),
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(10.0, 10.0),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
