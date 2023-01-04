import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleBar extends StatefulWidget {
  TitleBar({
    Key? key,
    required this.title,
    required this.isDrawerOpen,
  }) : super(key: key);

  final String title;
  bool isDrawerOpen;

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      color: Colors.transparent,
      margin: widget.isDrawerOpen
          ? const EdgeInsets.fromLTRB(10, 0, 0, 0)
          : const EdgeInsets.fromLTRB(80, 0, 0, 0),
      width: size.width - 80,
      height: 80,
      alignment: Alignment.centerLeft,
      child: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 3, 14, 23),
        ),
      ),
    );
  }
}
