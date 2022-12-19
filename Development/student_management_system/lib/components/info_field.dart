import 'package:flutter/material.dart';

class IconInfoField extends StatelessWidget {
  const IconInfoField({Key? key, required this.infofield, required this.icon})
      : super(key: key);

  final String infofield;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // width: size.width,
      margin: EdgeInsets.fromLTRB(
        size.width * 0.05,
        0,
        size.width * 0.05,
        10,
      ),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Icon(
                icon,
                size: 25,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Container(
              width: size.width * 0.8,
              child: Text(
                infofield,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClassInfoField extends StatelessWidget {
  const ClassInfoField({
    Key? key,
    required this.infofield,
    required this.color,
  }) : super(key: key);

  final String infofield;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // width: size.width,
      margin: EdgeInsets.fromLTRB(
        size.width * 0.05,
        0,
        size.width * 0.05,
        10,
      ),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8.0),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 26, 143, 227),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Text(
              infofield,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
