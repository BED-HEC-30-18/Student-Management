import 'package:flutter/material.dart';
import 'package:student_management_system/pages/agenda/view_event.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.subject,
    required this.study,
    required this.time,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String subject;
  final String study;
  final String time;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (() =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ViewTask();
          }))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5.0),
        width: size.width * 0.9,
        height: 75,
        decoration: BoxDecoration(
          color: Color.fromARGB(26, 207, 218, 227),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Color.fromARGB(12, 0, 0, 0),
            width: 1.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 20, 5),
              width: 5,
              height: 65,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Icon(
                        icon,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      study,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
