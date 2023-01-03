import 'package:flutter/material.dart';
import 'package:student_management_system/database/task_operations.dart';
import 'package:student_management_system/pages/agenda/event_card.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TaskOperations taskOperations = TaskOperations();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
            width: size.width,
            height: size.height * 0.5,
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
            child: Column(
              children: [
                TableCalendar(
                  focusedDay: selectedDay,
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2050),
                  calendarFormat: format,
                  onFormatChanged: (CalendarFormat _format) {
                    setState(() {
                      format = _format;
                    });
                  },
                  startingDayOfWeek: StartingDayOfWeek.monday,

                  //Day changed
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    setState(() {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                    });
                    print(focusedDay);
                  },
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(selectedDay, date);
                  },

                  //Calender styles
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
                    formatButtonShowsNext: false,
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
            )),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          child: FutureBuilder(
            future: taskOperations.getAllTasks(selectedDay),
            builder: (
              BuildContext context,
              AsyncSnapshot snapshot,
            ) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('Loading...'),
                );
              }
              return snapshot.data!.isEmpty
                  ? const Center(
                      child: Text('No Events in the list.'),
                    )
                  :
                  // : EventList(snapshot.data);
                  Container(
                      height: size.height * 0.3,
                      child: Center(
                        child: EventList(snapshot.data),
                      ),
                    );
            },
          ),
        )
      ],
    );
  }
}
