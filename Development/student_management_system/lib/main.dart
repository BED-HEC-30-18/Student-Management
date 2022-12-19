import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_management_system/pages/main/start_page.dart';
import 'package:student_management_system/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Management System",
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 239, 247, 246),
        primaryColor: Color.fromARGB(255, 26, 143, 227),
      ),
      home: StartPage(),
    );
  }
}
