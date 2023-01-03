import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.1,
      height: size.height * 0.06,
      child: IconButton(
        onPressed: (() => Navigator.pop(context)),
        icon: Icon(
          Icons.done_all,
          size: 36,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
