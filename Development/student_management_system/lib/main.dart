import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_management_system/components/theme/theme.dart';
import 'package:student_management_system/pages/main_page.dart';

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
      theme: theme(),
      home: MainPage(),
    );
  }
}
