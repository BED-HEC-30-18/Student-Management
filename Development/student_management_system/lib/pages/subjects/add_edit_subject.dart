import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/done_button.dart';
import 'package:student_management_system/components/title/titleback.dart';
import 'package:student_management_system/database/notes_database.dart';
import 'package:student_management_system/models/subject_model.dart';

class AddEditSubject extends StatefulWidget {
  final Subject? subject;
  const AddEditSubject({
    Key? key,
    this.subject,
  }) : super(key: key);

  @override
  State<AddEditSubject> createState() => _AddEditSubjectState();
}

class _AddEditSubjectState extends State<AddEditSubject> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late int color;
  late String teacher;

  @override
  void initState() {
    super.initState();

    title = widget.subject?.title ?? '';
    color = widget.subject?.color ?? 0;
    teacher = widget.subject?.teacher ?? '';
  }

  Widget DoneButton() {
    final isFormValid = title.isNotEmpty && teacher.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateSubject,
        child: Text('Save'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, size.width * 0.05, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BackTitle(title: "Add Subject"),
                    DoneButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addOrUpdateSubject() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.subject != null;

      if (isUpdating) {
        await updateSubject();
      } else {
        await addSubject();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateSubject() async {
    final subject = widget.subject!.copy(
      color: color,
      title: title,
      teacher: teacher,
    );

    await SubjectsDatabase.instance.update(subject);
  }

  Future addSubject() async {
    final subject = Subject(
      title: title,
      color: color,
      teacher: teacher,
    );

    await SubjectsDatabase.instance.create(subject);
  }
}
