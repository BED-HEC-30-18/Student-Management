import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(8),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(26, 207, 218, 227),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color.fromARGB(12, 0, 0, 0),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                10,
                10,
                10,
                10,
              ),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 209, 17, 73),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      "3 days left",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              "Mobile Development",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 209, 17, 73),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Text(
              "Project",
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          Container(
            width: size.width,
            alignment: Alignment.center,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  border: Border.all(
                    color: Color.fromARGB(255, 209, 17, 73),
                    width: 1.5,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
