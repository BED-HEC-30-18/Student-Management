import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackTitle extends StatelessWidget {
  BackTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  var destination;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 242, 242, 242)))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.8,
            margin: EdgeInsets.fromLTRB(size.width * 0.025, 0, 0, 0),
            child: Row(
              children: [
                Container(
                  height: size.height * 0.07,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 36,
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.06,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
                  child: FittedBox(
                    child: Text(
                      title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
