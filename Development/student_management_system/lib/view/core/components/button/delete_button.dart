import 'package:flutter/material.dart';

class DeleteButton extends StatefulWidget {
  DeleteButton({Key? key, required this.isTapped, this.onPressed})
      : super(key: key);

  bool isTapped;
  var onPressed;

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  bool isClicked = false;

  void trigger() async {
    setState(() {
      isClicked = true;
    });
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      isClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isTapped == true) {
      trigger();
    }
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isClicked
                ? const Color.fromARGB(0, 193, 47, 66)
                : const Color.fromARGB(78, 193, 47, 66),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(10.0, 10.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Material(
          child: InkWell(
            splashColor: Color.fromARGB(255, 228, 120, 56),
            child: Ink(
              height: 50,
              width: size.width * 0.9,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFE47838),
                    Color(0xFFC12F42),
                    Color(0xFFC12F42),
                    Color(0xFFC12F42),
                  ],
                ),
              ),
              // alignment: Alignment.center,
              child: Center(
                child: Text(
                  "Delete",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
