// import 'dart:ui';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:student_management_system/view/pages/sign/provider/facebook_sign_in.dart';
import 'package:student_management_system/view/pages/sign/provider/google_sign_in.dart';

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
            children: <Widget>[
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
            GestureDetector(
              onTap: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(26, 207, 218, 227),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromARGB(12, 0, 0, 0),
                    width: 1.5,
                  ),
                ),
                child: FaIcon(
                  FontAwesomeIcons.google,
                  color: Color.fromARGB(255, 219, 68, 55),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                final provider =
                    Provider.of<FacebookSignInProvider>(context, listen: false);
                provider.signInWithFacebook();
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(26, 207, 218, 227),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromARGB(12, 0, 0, 0),
                    width: 1.5,
                  ),
                ),
                child: FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Color.fromARGB(255, 59, 89, 152),
                ),
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
