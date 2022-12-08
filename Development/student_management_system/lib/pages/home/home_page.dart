import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:like_button/like_button.dart';
import 'package:student_management_system/components/button/barButton.dart';
import 'package:student_management_system/components/titlebar.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  bool isDrawerOpen;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final isDailOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (isDailOpen.value) {
          isDailOpen.value = false;

          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (() {}),
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(78, 2, 133, 227),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(10.0, 10.0),
                ),
              ],
            ),
            child: SpeedDial(
              animatedIcon: AnimatedIcons.add_event,
              animatedIconTheme: IconThemeData(
                size: 36,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              foregroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor: Theme.of(context).primaryColor,
              buttonSize: const Size(72.0, 72.0),
              childrenButtonSize: const Size(48.0, 48.0),
              spacing: 8,
              spaceBetweenChildren: 12,
              openCloseDial: isDailOpen,
              overlayOpacity: 0.2,
              overlayColor: Color.fromARGB(255, 3, 14, 23),
              children: [
                SpeedDialChild(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: FloatingActionButtonChild(
                    icon: Icons.create_rounded,
                  ),
                  label: "Test",
                ),
                SpeedDialChild(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: FloatingActionButtonChild(
                      icon: Icons.feed,
                    ),
                    label: "Homework"),
                SpeedDialChild(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: FloatingActionButtonChild(
                      icon: Icons.create_rounded,
                    ),
                    label: "Task"),
                SpeedDialChild(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: FloatingActionButtonChild(
                      icon: Icons.percent_rounded,
                    ),
                    label: "Grade"),
              ],
            ),
          ),
        ),
        body: widget.isDrawerOpen
            ? MainSection(
                widget: widget,
              )
            : SafeArea(
                child: MainSection(
                  widget: widget,
                ),
              ),
      ),
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TitleBar(
          title: "Home",
          isDrawerOpen: widget.isDrawerOpen,
        ),
        Container(
          width: size.width * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        )
      ],
    );
  }
}

class FloatingActionButtonChild extends StatelessWidget {
  const FloatingActionButtonChild({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(51, 239, 247, 246),
            spreadRadius: 0,
            blurRadius: 40,
            offset: Offset(-5.0, -5.0),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(26, 26, 143, 227),
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(10.0, 10.0),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
