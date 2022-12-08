import 'package:flutter/material.dart';
import 'package:student_management_system/components/drawer/drawer_item.dart';
import 'package:student_management_system/components/drawer/drawer_items.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;

  const DrawerWidget({Key? key, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 80, 8, 0),
      child: SingleChildScrollView(
          child: Column(
        children: [
          buildDrawerItems(context),
        ],
      )),
    );
  }

  Widget buildDrawerItems(BuildContext context) => Column(
        children: DrawerItems.all
            .map(
              (item) => ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 0,
                ),
                leading: Icon(
                  item.icon,
                  color: Color.fromARGB(255, 239, 247, 246),
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 239, 247, 246), fontSize: 20),
                ),
                onTap: () => onSelectedItem(item),
                selectedColor: Color.fromARGB(96, 239, 247, 246),
              ),
            )
            .toList(),
      );
}
