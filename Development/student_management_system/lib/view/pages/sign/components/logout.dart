// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_system/view/core/components/button/barButton.dart';
import 'package:student_management_system/view/pages/sign/provider/google_sign_in.dart';

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
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.logout();
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
