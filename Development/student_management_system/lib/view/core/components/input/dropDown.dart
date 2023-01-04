import 'package:flutter/material.dart';
import 'package:student_management_system/data/Operations/subject_operations.dart';
import 'package:student_management_system/domain/models/subject_model.dart';
import 'package:student_management_system/view/core/components/title/fieldTitle.dart';

typedef void StringCallback(String val);

// ignore: must_be_immutable
class DropDownMenu extends StatefulWidget {
  final String title;
  final String hint;
  String? selected;
  final List<String> selection;
  final StringCallback callback;
  DropDownMenu({
    Key? key,
    required this.selected,
    required this.selection,
    required this.title,
    required this.hint,
    required this.callback,
  }) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        fieldTitle(title: widget.title),
        Container(
          margin: EdgeInsets.fromLTRB(
            0,
            size.height * 0.01,
            0,
            size.height * 0.01,
          ),
          padding: const EdgeInsets.fromLTRB(
            12,
            0,
            0,
            0,
          ),
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Color.fromARGB(26, 207, 218, 227),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color.fromARGB(25, 0, 0, 0),
            ),
          ),
          // height: 50,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              hintText: widget.hint,
              icon: Icon(Icons.book),
              iconColor: Colors.black,
              fillColor: Color.fromARGB(26, 207, 218, 227),
              border: InputBorder.none,
            ),
            value: widget.selected,
            items: widget.selection
                .map(
                  (select) => DropdownMenuItem<String>(
                    value: select,
                    child: Text(
                      select,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (select) => setState(() {
              widget.selected = select;
              widget.callback(select!);
            }),
          ),
        ),
      ],
    );
  }
}

typedef void SubjectCallback(Subject val);

// ignore: must_be_immutable
class SubjectDrop extends StatefulWidget {
  Subject? selected;
  final SubjectCallback callback;
  SubjectDrop({Key? key, this.selected, required this.callback})
      : super(key: key);

  @override
  State<SubjectDrop> createState() => _SubjectDropState();
}

class _SubjectDropState extends State<SubjectDrop> {
  SubjectOperations subjectOperations = SubjectOperations();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        fieldTitle(title: "Subject"),
        Container(
          margin: EdgeInsets.fromLTRB(
            0,
            size.height * 0.01,
            0,
            size.height * 0.01,
          ),
          padding: const EdgeInsets.fromLTRB(
            12,
            0,
            0,
            0,
          ),
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Color.fromARGB(26, 207, 218, 227),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color.fromARGB(25, 0, 0, 0),
            ),
          ),
          // height: 50,
          child: FutureBuilder(
            future: subjectOperations.getAllSubjects(),
            builder: (
              BuildContext context,
              AsyncSnapshot snapshot,
            ) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('Loading...'),
                );
              }
              return snapshot.data!.isEmpty
                  ? Container(
                      height: 50,
                      child: Text('No Events in the list.'),
                    )
                  : SubjectDropdown(
                      subjects: snapshot.data,
                      selectedSubject: widget.selected,
                      callback: (val) {
                        widget.callback(val);
                        setState(() => widget.selected = val);
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class SubjectDropdown extends StatefulWidget {
  List<Subject> subjects;
  Subject? selectedSubject;

  final SubjectCallback callback;
  SubjectDropdown({
    Key? key,
    required this.subjects,
    required this.selectedSubject,
    required this.callback,
  }) : super(key: key);

  @override
  State<SubjectDropdown> createState() => _SubjectDropdownState();
}

class _SubjectDropdownState extends State<SubjectDropdown> {
  @override
  Widget build(BuildContext context) {
    widget.selectedSubject = widget.subjects[0];
    return DropdownButtonFormField<Subject>(
      decoration: InputDecoration(
        filled: true,
        hintText: 'Pick the class type',
        icon: Icon(Icons.circle),
        iconColor: Colors.black,
        fillColor: Color.fromARGB(26, 207, 218, 227),
        border: InputBorder.none,
      ),
      value: widget.selectedSubject!,
      items: widget.subjects
          .map(
            (sub) => DropdownMenuItem<Subject>(
              value: sub,
              child: Text(
                sub.title,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: (sub) => setState(() {
        widget.selectedSubject = sub!;
        widget.callback(sub);
      }),
    );
  }
}
