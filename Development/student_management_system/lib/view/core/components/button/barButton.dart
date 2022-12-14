import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BarButton extends StatefulWidget {
  BarButton(
      {Key? key, required this.title, required this.isTapped, this.onPressed})
      : super(key: key);

  final String title;
  bool isTapped;
  var onPressed;

  @override
  State<BarButton> createState() => _BarButtonState();
}

class _BarButtonState extends State<BarButton> {
  bool isClicked = false;

  void trigger() async {
    setState(() {
      isClicked = true;
    });
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      isClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isTapped == true) {
      trigger();
    }
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isClicked
                ? const Color.fromARGB(0, 2, 148, 252)
                : const Color.fromARGB(78, 2, 148, 252),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(10.0, 10.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Material(
          child: InkWell(
            highlightColor: const Color.fromARGB(63, 26, 143, 227),
            splashColor: const Color.fromARGB(127, 26, 143, 227),
            child: Ink(
              height: 50,
              width: size.width * 0.9,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF90E3F4),
                    Color(0xFF0394FC),
                    Color(0xFF0394FC),
                    Color(0xFF0394FC),
                  ],
                ),
              ),
              // alignment: Alignment.center,
              child: Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
