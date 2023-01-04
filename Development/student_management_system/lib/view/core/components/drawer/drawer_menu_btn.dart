import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerMenuButton extends StatefulWidget {
  VoidCallback onClicked;
  bool isDrawerOpened;

  DrawerMenuButton(
      {Key? key, required this.onClicked, required this.isDrawerOpened})
      : super(key: key);

  @override
  State<DrawerMenuButton> createState() => _DrawerMenuButtonState();
}

class _DrawerMenuButtonState extends State<DrawerMenuButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;

  @override
  void initState() {
    super.initState();

    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
  }

  bool menuOpened = false;
  void menuTapped() {
    if (menuOpened == false && widget.isDrawerOpened == false) {
      animatedController.forward();
      widget.onClicked();
      menuOpened = true;
    } else {
      animatedController.reverse();
      menuOpened = false;
      widget.onClicked();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (menuOpened == true && widget.isDrawerOpened == false) {
      animatedController.reverse();
      menuOpened = false;
    }
    return GestureDetector(
      onTap: menuTapped,
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: animatedController,
        size: 50,
        color: menuOpened
            ? const Color.fromARGB(255, 239, 247, 246)
            : const Color.fromARGB(255, 3, 14, 23),
      ),
    );
  }
}


// onPressed: onClicked,
//       icon: Icon(
//         Icons.menu_rounded,
//       ),
//       color: const Color.fromARGB(255, 3, 14, 23),
//       iconSize: 50,
//     );