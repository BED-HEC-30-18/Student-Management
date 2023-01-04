import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:student_management_system/data/Operations/task_operations.dart';
import 'package:student_management_system/domain/models/subject_model.dart';
import 'package:student_management_system/domain/models/task_model.dart';
import 'package:student_management_system/view/pages/agenda/view_event.dart';

// ignore: must_be_immutable
class EventList extends StatefulWidget {
  List<Task> tasks;
  EventList(List<Task> this.tasks, {Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  TaskOperations taskOperations = TaskOperations();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          final task = widget.tasks[index];
          final time = DateFormat.Hm().format(task.time);
          return Container(
            child: FutureBuilder(
              future: taskOperations.getSubject(task),
              builder: (
                BuildContext context,
                AsyncSnapshot snapshot,
              ) {
                if (!snapshot.hasData) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                      0,
                      size.height * 0.01,
                      0,
                      size.height * 0.01,
                    ),
                    padding: const EdgeInsets.fromLTRB(
                      0,
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
                    child: Text('Loading...'),
                  );
                } else {
                  return EventCard(
                      task: task, time: time, subject: snapshot.data);
                }
              },
            ),
          );
        });
  }
}

// ignore: must_be_immutable
class EventCard extends StatefulWidget {
  Task task;
  String time;
  Subject subject;
  EventCard(
      {Key? key, required this.task, required this.time, required this.subject})
      : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  TaskOperations taskOperations = TaskOperations();
  // late Subject subject;
  // bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();

  //   refreshSubject();
  // }

  // Future<Subject> refreshSubject() async {
  // setState(() {
  //   isLoading = true;
  // });
  // print(subject.title);

  // return await taskOperations.getSubject(widget.task);

  // setState(() {
  //   isLoading = false;
  // });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Slidable(
      key: Key('${widget.task.id}'),
      startActionPane: ActionPane(
        motion: BehindMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {
              taskOperations.deleteTask(widget.task);
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
              taskOperations.deleteTask(widget.task);
            }),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            foregroundColor: Color.fromARGB(255, 105, 105, 105),
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: (() =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ViewTask(
                task: widget.task,
              );
            }))),
        child: Container(
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
                  color: Color(widget.subject.color),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.subject.title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.time,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Icon(
                          Icons.book,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.task.type,
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
  }
}
