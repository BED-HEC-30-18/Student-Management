import 'package:flutter/material.dart';
import 'package:student_management_system/view/core/components/drawer/drawer_item.dart';

class DrawerItems {
  static const home = DrawerItem(title: 'Home', icon: Icons.home_rounded);
  static const timetable =
      DrawerItem(title: 'Timetable', icon: Icons.grid_3x3_rounded);
  static const calendar =
      DrawerItem(title: 'Calendar', icon: Icons.calendar_today);
  static const subjects = DrawerItem(title: 'Subjects', icon: Icons.book);
  static const settings =
      DrawerItem(title: 'Settings', icon: Icons.settings_rounded);

  static final List<DrawerItem> all = [
    home,
    timetable,
    calendar,
    subjects,
    settings,
  ];
}
