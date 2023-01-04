import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_management_system/view/core/main/main_page.dart';
import 'package:student_management_system/view/pages/sign/login/login_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);
  // Check auth state of app when staring up
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return MainPage();
          } else if (snapshot.hasError) {
            return (Center(
              child: Text('Something Went Wrong!'),
            ));
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
