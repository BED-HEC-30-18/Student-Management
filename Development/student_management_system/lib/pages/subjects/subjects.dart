import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:student_management_system/components/button/addButton.dart';
import 'package:student_management_system/components/title/titlebar.dart';
import 'package:student_management_system/database/subject_operations.dart';
import 'package:student_management_system/models/subject_model.dart';
import 'package:student_management_system/pages/subjects/add_edit_subject.dart';
import 'package:student_management_system/pages/subjects/view_subject.dart';

class SubjectPage extends StatelessWidget {
  SubjectPage({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isDrawerOpen
          ? MainSection(isDrawerOpen: isDrawerOpen)
          : SafeArea(
              child: MainSection(isDrawerOpen: isDrawerOpen),
            ),
      floatingActionButton: AddButton(
        destination: AddEditSubject(
          edit: false,
        ),
      ),
    );
  }
}

class MainSection extends StatefulWidget {
  const MainSection({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  final bool isDrawerOpen;

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  // late List<Subject> subjects;
  // bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();

  //   refreshSubjects();
  // }

  // Future refreshSubjects() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   this.subjects = await SubjectsDatabase.instance.readAllSubjects();

  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  SubjectOperations subjectOperations = SubjectOperations();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TitleBar(
          title: "Subjects",
          isDrawerOpen: widget.isDrawerOpen,
        ),
        Expanded(
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
                  ? const Center(
                      child: Text('No Groceries in the list.'),
                    )
                  : SubjectList(snapshot.data);
            },
          ),
          // Container(
          //   child: isLoading
          //       CircularProgressIndicator()
          //       : subjects.isEmpty
          //            Container(
          //               alignment: Alignment(0, -0.2),
          //               child: Text(
          //                 "No Subjects",
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 32,
          //                 ),
          //               ),
          //             )
          // : FutureBuilder(
          //   future: subjectOperations.getAllSubjects(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasError) print('error');
          //     var data = snapshot.data;
          //     return SubjectList(data);
          //   },
          // ),
          // ),
          // : Column(
          //     children: [
          //       SubjectList(
          //         subject: "Mobile Design and Development",
          //         teacher: "Mr Isaac Mwakabira",
          //         color: Color.fromARGB(255, 26, 143, 227),
          //       ),
          // SubjectList(
          //   subject: "Geospatial Computing",
          //   teacher: "Mr Kondwani Munthali",
          //   color: Color.fromARGB(255, 243, 121, 51),
          // ),
          // SubjectList(
          //   subject: "Research Methods and Ethics",
          //   teacher: "Mrs Chipo Kanjo",
          //   color: Color.fromARGB(255, 230, 194, 41),
          // ),
          // SubjectList(
          //   subject: "Project Management",
          //   teacher: "Mr Tiwonge Manda",
          //   color: Color.fromARGB(255, 102, 16, 242),
          // ),
          // SubjectList(
          //   subject: "Game Development",
          //   teacher: "Mr Mwawi Mshaha",
          //   color: Color.fromARGB(255, 209, 17, 73),
          // ),
          //     ],
          //   ),
        ),
      ],
    );
  }
}

class SubjectList extends StatelessWidget {
  List<Subject> subjects;
  SubjectList(
    List<Subject> this.subjects, {
    Key? key,
  }) : super(key: key);

  SubjectOperations subjectOperations = SubjectOperations();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return Slidable(
            key: Key('${subjects[index].id}'),
            startActionPane: ActionPane(
              motion: BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    subjectOperations.deleteSubject(subjects[index]);
                  }),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  foregroundColor: Color.fromARGB(255, 105, 105, 105),
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    subjectOperations.deleteSubject(subjects[index]);
                  }),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  foregroundColor: Color.fromARGB(255, 105, 105, 105),
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                print(subjects[index].color);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewSubject(
                      subject: subjects[index],
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.025, vertical: 5.0),
                // width: size.width * 0.9,
                height: 75,
                decoration: BoxDecoration(
                  color: Color.fromARGB(26, 207, 218, 227),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromARGB(12, 0, 0, 0),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 5, 20, 5),
                      width: 5,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Color(subjects[index].color),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${subjects[index].title}",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: const Icon(
                                Icons.account_circle_rounded,
                                size: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "${subjects[index].teacher}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
