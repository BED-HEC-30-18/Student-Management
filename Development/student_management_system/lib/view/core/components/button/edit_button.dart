import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditButton extends StatelessWidget {
  EditButton({Key? key, required this.destination}) : super(key: key);

  var destination;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.1,
      margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.05, 0),
      child: IconButton(
        onPressed: (() =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return destination;
            }))),
        icon: const Icon(
          Icons.edit,
          size: 36,
        ),
      ),
    );
  }
}
