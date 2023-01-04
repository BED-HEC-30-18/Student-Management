import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:student_management_system/data/Operations/class_operations.dart';
import 'package:student_management_system/domain/models/class_model.dart';
import 'package:student_management_system/domain/models/subject_model.dart';
import 'package:student_management_system/view/core/components/button/delete_button.dart';
import 'package:student_management_system/view/core/components/info_field.dart';
import 'package:student_management_system/view/core/components/title/titleback.dart';
import 'package:student_management_system/view/pages/classes/add_edit_class.dart';

// ignore: must_be_immutable
class ViewClass extends StatefulWidget {
  Period period;
  ViewClass({Key? key, required this.period}) : super(key: key);

  @override
  State<ViewClass> createState() => _ViewClassState();
}

class _ViewClassState extends State<ViewClass> {
  bool isTapped = false;
  bool isLoading = false;

  PeriodOperations periodOperations = PeriodOperations();

  void click() async {
    setState(() {
      isTapped = true;
    });
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      isTapped = false;
    });
    periodOperations.deletePeriod(widget.period);
    Navigator.pop(context);
  }

  Widget EditButton() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.1,
      margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.05, 0),
      child: IconButton(
        onPressed: (() async {
          Subject subject = await periodOperations.getSubject(widget.period);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AddEditClass(
                period: widget.period,
                subject: subject,
                edit: true,
              );
            }),
          );
        }),
        icon: const Icon(
          Icons.edit,
          size: 36,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Subject subject = periodOperations.getSubject(widget.period);
    final start = "${widget.period.startH} : ${widget.period.startM}";
    final end = "${widget.period.endH} : ${widget.period.endM}";
    final day = getDay(widget.period.day);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackTitle(title: "View Class"),
                EditButton(),
              ],
            ),
            Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClassInfoField(
                    infofield: "${subject.title}",
                    color: Color(subject.color),
                  ),
                  IconInfoField(
                    icon: Icons.account_circle_rounded,
                    infofield: "${widget.period.type}",
                  ),
                  IconInfoField(
                    icon: Icons.location_on,
                    infofield: "${widget.period.location}",
                  ),
                  IconInfoField(
                    icon: Icons.calendar_today,
                    infofield: "$day",
                  ),
                  IconInfoField(
                    icon: Icons.access_time,
                    infofield: '$start - $end',
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: click,
              child: DeleteButton(isTapped: isTapped),
            ),
          ],
        ),
      ),
    );
  }

  String getDay(int index) {
    switch (widget.period.day) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "Monday";
    }
  }
}
