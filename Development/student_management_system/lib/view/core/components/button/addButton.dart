import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddButton extends StatelessWidget {
  AddButton({Key? key, required this.destination}) : super(key: key);

  var destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: (() =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return destination;
            }))),
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(78, 2, 133, 227),
                spreadRadius: 0,
                blurRadius: 50,
                offset: Offset(10.0, 10.0),
              ),
            ],
          ),
          child: Icon(
            Icons.add,
            size: 36,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
