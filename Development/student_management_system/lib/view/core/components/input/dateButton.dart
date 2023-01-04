import 'package:flutter/material.dart';
import 'package:student_management_system/view/core/components/title/fieldTitle.dart';

typedef void DateTimeCallback(DateTime val);

class DateButton extends StatefulWidget {
  DateTime date;
  final DateTimeCallback callback;
  final String title;
  DateButton({
    Key? key,
    required this.date,
    required this.callback,
    required this.title,
  }) : super(key: key);

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        widget.date = value!;
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
          onTap: _showDatePicker,
          child: Container(
            margin: EdgeInsets.fromLTRB(
              0,
              size.height * 0.01,
              0,
              size.height * 0.01,
            ),
            padding: const EdgeInsets.fromLTRB(
              0,
              0,
              10,
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
                    10,
                    0,
                    10,
                    0,
                  ),
                  child: Icon(
                    Icons.calendar_today_rounded,
                    size: 24,
                  ),
                ),
                Text(
                  '${widget.date.day}/${widget.date.month}/${widget.date.year}',
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
