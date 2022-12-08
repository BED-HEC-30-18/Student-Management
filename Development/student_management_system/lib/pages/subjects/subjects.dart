import 'package:flutter/material.dart';
import 'package:student_management_system/components/titlebar.dart';

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
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TitleBar(
          title: "Subjects",
          isDrawerOpen: isDrawerOpen,
        ),
        Container(
          width: size.width * 0.95,
          child: Column(
            children: const [
              Case(
                subject: "Mobile Design and Development",
                teacher: "Mr Isaac Mwakabira",
                color: Color.fromARGB(255, 26, 143, 227),
              ),
              Case(
                subject: "Geospatial Computing",
                teacher: "Mr Kondwani Munthali",
                color: Color.fromARGB(255, 243, 121, 51),
              ),
              Case(
                subject: "Research Methods and Ethics",
                teacher: "Mrs Chipo Kanjo",
                color: Color.fromARGB(255, 230, 194, 41),
              ),
              Case(
                subject: "Project Management",
                teacher: "Mr Tiwonge Manda",
                color: Color.fromARGB(255, 102, 16, 242),
              ),
              Case(
                subject: "Game Development",
                teacher: "Mr Mwawi Mshaha",
                color: Color.fromARGB(255, 209, 17, 73),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Case extends StatelessWidget {
  const Case({
    Key? key,
    required this.subject,
    required this.teacher,
    required this.color,
  }) : super(key: key);

  final String subject;
  final String teacher;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5.0),
      width: size.width * 0.9,
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
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
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
                    teacher,
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
    );
  }
}
