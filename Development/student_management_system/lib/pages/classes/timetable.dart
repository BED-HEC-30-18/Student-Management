import 'package:flutter/material.dart';
import 'package:student_management_system/pages/classes/view_class.dart';
import 'package:timetable_view/timetable_view.dart';

class Timetable extends StatefulWidget {
  Timetable({Key? key}) : super(key: key);

  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  @override
  Widget build(BuildContext context) {
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

  List<LaneEvents> _buildLaneEvents() {
    return [
      LaneEvents(
        lane: Lane(
          name: 'Mon',
          laneIndex: 1,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: [
          TableEvent(
            title: 'Mobile Development',
            eventId: 11,
            startTime: TableEventTime(hour: 8, minute: 0),
            endTime: TableEventTime(hour: 9, minute: 0),
            laneIndex: 1,
          ),
          TableEvent(
            eventId: 12,
            title: 'Mobile Development \n\n',
            location: "CK 2",
            laneIndex: 1,
            startTime: TableEventTime(hour: 13, minute: 0),
            endTime: TableEventTime(hour: 15, minute: 0),
          ),
        ],
      ),
      LaneEvents(
        lane: Lane(
          name: 'Tue',
          laneIndex: 2,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: [
          TableEvent(
            title: 'Mobile Development',
            laneIndex: 2,
            eventId: 21,
            startTime: TableEventTime(hour: 7, minute: 00),
            endTime: TableEventTime(hour: 8, minute: 00),
          ),
          TableEvent(
              title: 'Geospatial Computing',
              laneIndex: 2,
              eventId: 22,
              startTime: TableEventTime(hour: 12, minute: 00),
              endTime: TableEventTime(hour: 13, minute: 00),
              backgroundColor: Color.fromARGB(255, 242, 121, 51)),
        ],
      ),
      LaneEvents(
        lane: Lane(
          name: 'Wed',
          laneIndex: 3,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: [],
      ),
      LaneEvents(
        lane: Lane(
          name: 'Thu',
          laneIndex: 4,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: [],
      ),
      LaneEvents(
        lane: Lane(
          name: 'Fri',
          laneIndex: 5,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: [
          TableEvent(
            title: 'Mobile Development',
            laneIndex: 5,
            eventId: 51,
            startTime: TableEventTime(hour: 11, minute: 00),
            endTime: TableEventTime(hour: 12, minute: 00),
          ),
        ],
      ),
      LaneEvents(
        lane: Lane(
          name: 'Sat',
          laneIndex: 6,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: [],
      ),
      LaneEvents(
        lane: Lane(
          name: 'Sun',
          laneIndex: 7,
          textStyle: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        events: [],
      ),
    ];
  }

  void onEventTapCallBack(TableEvent event) {
    print(
        "Event Clicked!! LaneIndex ${event.laneIndex} Title: ${event.title} StartHour: ${event.startTime.hour} EndHour: ${event.endTime.hour}");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ViewClass();
    }));
  }

  void onTimeSlotTappedCallBack(
      int laneIndex, TableEventTime start, TableEventTime end) {
    print(
        "Empty Slot Clicked !! LaneIndex: $laneIndex StartHour: ${start.hour} EndHour: ${end.hour}");
  }
}
