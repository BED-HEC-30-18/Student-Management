import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/barButton.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  bool isTapped = false;

  void click() async {
    setState(() {
      isTapped = true;
    });
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      isTapped = false;
    });
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: BarButton(
        title: "Sign Out",
        isTapped: isTapped,
      ),
    );
  }
}
