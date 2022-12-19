import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
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
    );
  }
}
