import 'package:flutter/material.dart';

class OtherSignInOption extends StatelessWidget {
  const OtherSignInOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          width: size.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              LineDivider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Other Sign in Options",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              LineDivider(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.facebook,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.facebook,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LineDivider extends StatelessWidget {
  const LineDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: const Divider(
        color: Color.fromARGB(255, 3, 14, 23),
        height: 3,
      ),
    );
  }
}
