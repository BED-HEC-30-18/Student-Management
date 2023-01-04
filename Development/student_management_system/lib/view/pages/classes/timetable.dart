import 'package:flutter/material.dart';
import 'package:student_management_system/data/Operations/class_operations.dart';
import 'package:student_management_system/domain/models/class_model.dart';
import 'package:student_management_system/domain/models/subject_model.dart';
import 'package:timetable_view/timetable_view.dart';

class Timetable extends StatefulWidget {
  Timetable({Key? key}) : super(key: key);

  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  PeriodOperations periodOperations = PeriodOperations();

  List<Period>? period1;
  List<Period>? period2;
  List<Period>? period3;
  List<Period>? period4;
  List<Period>? period5;
  List<Period>? period6;
  List<Period>? period7;
  List<TableEvent> event1 = [];
  List<TableEvent> event2 = [];
  List<TableEvent> event3 = [];
  List<TableEvent> event4 = [];
  List<TableEvent> event5 = [];
  List<TableEvent> event6 = [];
  List<TableEvent> event7 = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() {
      isLoading = true;
    });
    this.period1 = await periodOperations.getAllPeriods(1);
    this.period2 = await periodOperations.getAllPeriods(2);
    this.period3 = await periodOperations.getAllPeriods(3);
    this.period4 = await periodOperations.getAllPeriods(4);
    this.period5 = await periodOperations.getAllPeriods(5);
    this.period6 = await periodOperations.getAllPeriods(6);
    this.period7 = await periodOperations.getAllPeriods(7);
    this.event1 = getPeriodsDay(period1!);
    this.event2 = getPeriodsDay(period2!);
    this.event3 = getPeriodsDay(period3!);
    this.event4 = getPeriodsDay(period4!);
    this.event5 = getPeriodsDay(period5!);
    this.event6 = getPeriodsDay(period6!);
    this.event7 = getPeriodsDay(period7!);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // int lane5 = 5;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: TimetableView(
        laneEventsList: _buildLaneEvents(),
        onEventTap: onEventTapCallBack,
        timetableStyle: TimetableStyle(
          laneWidth: size.width * 0.2,
          mainBackgroundColor: const Color.fromARGB(255, 232, 240, 239),
          laneColor: Theme.of(context).scaffoldBackgroundColor,
          cornerColor: Theme.of(context).scaffoldBackgroundColor,
          timelineColor: Theme.of(context).scaffoldBackgroundColor,
          timelineItemColor: Theme.of(context).scaffoldBackgroundColor,
          timeItemTextColor: const Color.fromARGB(255, 105, 105, 105),
        ),
        onEmptySlotTap: onTimeSlotTappedCallBack,
      ),
    );
  }

  TableEvent convertPeriodsDay(Period period) {
    Subject subject = periodOperations.getSubject(period);
    TableEvent classes = TableEvent(
      title: subject.title,
      laneIndex: period.day,
      eventId: int.parse("${period.day}${period.id}"),
      startTime: TableEventTime(hour: period.startH, minute: period.startM),
      endTime: TableEventTime(hour: period.endH, minute: period.endM),
      backgroundColor: Color(subject.color),
    );
    return classes;
  }

  List<TableEvent> getPeriodsDay(List<Period> allPeriods) {
    List<TableEvent> classes =
        allPeriods.map((period) => convertPeriodsDay(period)).toList();
    return classes;
  }

  List<LaneEvents> _buildLaneEvents() {
    return [
      LaneEvents(
        lane: Lane(
          name: 'Mon',
          laneIndex: 1,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: event1,
      ),
      LaneEvents(
          lane: Lane(
            name: 'Tue',
            laneIndex: 2,
            textStyle:
                const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          events: event2),
      LaneEvents(
        lane: Lane(
          name: 'Wed',
          laneIndex: 3,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: event3,
      ),
      LaneEvents(
        lane: Lane(
          name: 'Thu',
          laneIndex: 4,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: event4,
      ),
      LaneEvents(
        lane: Lane(
          name: 'Fri',
          laneIndex: 5,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: event5,
      ),
      LaneEvents(
        lane: Lane(
          name: 'Sat',
          laneIndex: 6,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: event6,
      ),
      LaneEvents(
        lane: Lane(
          name: 'Sun',
          laneIndex: 7,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: event7,
      ),
    ];
  }

  void onEventTapCallBack(TableEvent event) {
    print(
        "Event Clicked!! LaneIndex ${event.laneIndex} Title: ${event.title} StartHour: ${event.startTime.hour} EndHour: ${event.endTime.hour}");
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    // return ViewClass();
    // }));
  }

  void onTimeSlotTappedCallBack(
      int laneIndex, TableEventTime start, TableEventTime end) {
    print(
        "Empty Slot Clicked !! LaneIndex: $laneIndex StartHour: ${start.hour} EndHour: ${end.hour}");
  }
}

// class Events extends StatefulWidget {
//   final int selectedDay;
//   const Events({Key? key, required this.selectedDay}) : super(key: key);

//   @override
//   State<Events> createState() => _EventsState();
// }

// class _EventsState extends State<Events> {
//   PeriodOperations periodOperations = PeriodOperations();

//   TableEvent Event(Period period, Subject subject) {
//     return TableEvent(
//       title: subject.title,
//       laneIndex: period.day,
//       eventId: int.parse("${period.day}${period.id}"),
//       startTime: TableEventTime(hour: period.startH, minute: period.startM),
//       endTime: TableEventTime(hour: period.endH, minute: period.endM),
//       backgroundColor: Color(subject.color),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: periodOperations.getAllPeriods(widget.selectedDay),
//       builder: (
//         BuildContext context,
//         AsyncSnapshot snapshot,
//       ) {
//         if (!snapshot.hasData) {
//           return [];
//         } else {
//           return buildEventsList(snapshot.data);
//         }
//       },
//     );
//   }

//   Widget buildEventsList(List<Period> periods) {
//     return ListView.builder(
//         padding: const EdgeInsets.all(8),
//         itemCount: periods.length,
//         itemBuilder: (context, index) {
//           final period = periods[index];
//           return Container(
//             child: FutureBuilder(
//                 future: periodOperations.getSubject(periods[index]),
//                 builder: (
//                   BuildContext context,
//                   AsyncSnapshot snapshot,
//                 ) {
//                   if (!snapshot.hasData) {
//                     TableEvent(
//                       title: 'Geospatial Computing',
//                       laneIndex: 2,
//                       eventId: 22,
//                       startTime: TableEventTime(hour: 12, minute: 00),
//                       endTime: TableEventTime(hour: 13, minute: 00),
//                       backgroundColor: Color.fromARGB(255, 242, 121, 51),
//                     );
//                   } else {
//                     return Event(period, subject);
//                   }
//                 }),
//           );
//         });
//   }
// }
