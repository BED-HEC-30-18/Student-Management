import 'package:flutter/material.dart';
import 'package:student_management_system/components/drawer/drawer_item.dart';
import 'package:student_management_system/components/drawer/drawer_items.dart';
import 'package:student_management_system/components/drawer/drawer_menu_btn.dart';
import 'package:student_management_system/components/drawer/drawer_widget.dart';
import 'package:student_management_system/pages/home/home_page.dart';
import 'package:student_management_system/pages/settings/settings.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  bool isDragging = false;
  DrawerItem item = DrawerItems.home;

  @override
  void initState() {
    super.initState();

    closeDrawer();
  }

  void openDrawer() => setState(() {
        isDrawerOpen = true;
        xOffset = 230;
        yOffset = 100;
        scaleFactor = 0.75;
      });

  void closeDrawer() => setState(() {
        isDrawerOpen = false;
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          buildDrawer(),
          buildBackdrop(),
          buildPage(),
          buildMenu(),
        ],
      ),
    );
  }

  Widget buildMenu() => SafeArea(
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          width: 80,
          height: 80,
          child: DrawerMenuButton(
            onClicked: isDrawerOpen ? closeDrawer : openDrawer,
            isDrawerOpened: isDrawerOpen,
          ),
        ),
      );

  Widget buildDrawer() => SafeArea(
        child: isDrawerOpen
            ? Container(
                width: xOffset,
                child: DrawerWidget(
                  onSelectedItem: (item) {
                    setState(() => this.item = item);
                    closeDrawer();
                  },
                ),
              )
            : Container(),
      );

  Widget buildBackdrop() {
    return AnimatedContainer(
      curve: Curves.elasticOut,
      duration: Duration(milliseconds: 1400),
      transform: Matrix4.translationValues(xOffset - 20, yOffset + 6, 0)
        ..scale(scaleFactor * 0.97),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isDrawerOpen ? 5 : 0),
        child: Container(
          color: Color.fromARGB(96, 239, 247, 246),
        ),
      ),
    );
  }

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();

          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;

          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }

          isDragging = false;
        },
        child: AnimatedContainer(
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: 1500),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 5 : 0),
              child: Container(
                child: getDrawerPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.home:
        return HomePage(
          isDrawerOpen: isDrawerOpen,
        );
      // case DrawerItems.timetable:
      //   return TimetablePage(
      //     isDrawerOpen: isDrawerOpen,
      //   );
      // case DrawerItems.calendar:
      //   return CalendarPage(
      //     isDrawerOpen: isDrawerOpen,
      //   );
      // case DrawerItems.subjects:
      //   return SubjectPage(
      //     isDrawerOpen: isDrawerOpen,
      //   );
      case DrawerItems.settings:
        return SettingPage(
          isDrawerOpen: isDrawerOpen,
        );
      default:
        return HomePage(
          isDrawerOpen: isDrawerOpen,
        );
    }
  }
}
