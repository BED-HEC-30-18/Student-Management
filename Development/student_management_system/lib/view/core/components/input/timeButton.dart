import 'package:flutter/material.dart';
import 'package:student_management_system/view/core/components/title/fieldTitle.dart';

typedef void TimeOfDayCallback(TimeOfDay val);

class TimeButton extends StatefulWidget {
  TimeOfDay time;
  final TimeOfDayCallback callback;
  final String title;
  TimeButton({
    super.key,
    required this.time,
    required this.title,
    required this.callback,
  });

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  void _tyme() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        // print(value!.format(context).toString());
        widget.time = value!;
        widget.callback(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        fieldTitle(title: widget.title),
        GestureDetector(
          onTap: _tyme,
          child: Container(
            margin: EdgeInsets.fromLTRB(
              0,
              size.height * 0.01,
              0,
              size.height * 0.01,
            ),
            padding: const EdgeInsets.fromLTRB(
              10,
              0,
              0,
              0,
            ),
            height: 50,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: Color.fromARGB(26, 207, 218, 227),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color.fromARGB(25, 0, 0, 0),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                    0,
                    0,
                    10,
                    0,
                  ),
                  child: Icon(
                    Icons.alarm,
                    size: 24,
                  ),
                ),
                Text(
                  widget.time.format(context).toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 105, 105, 105),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
