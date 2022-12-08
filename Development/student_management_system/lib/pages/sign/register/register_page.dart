import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_management_system/components/button/barButton.dart';
import 'package:student_management_system/components/button/loadButton.dart';
import 'package:student_management_system/pages/sign/components/fieldTitle.dart';
import 'package:student_management_system/pages/sign/components/inputField.dart';
import 'package:student_management_system/pages/sign/components/otherSignOptions.dart';
import 'package:student_management_system/pages/sign/components/passwordField.dart';
import 'package:student_management_system/pages/sign/components/signInUpBtn.dart';
import 'package:student_management_system/pages/sign/login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 247, 246),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 10,
              ),
              //Sign-In button
              SignInOrSignUp(
                title: 'Sign In ',
                destination: const LoginPage(),
              ),
              // Greetings section
              Container(
                child: const Text(
                  "Please enter your details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //textfields
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // fullname
                  const fieldTitle(title: "Fullname"),
                  RoundInputField(
                    hintText: "e.g. Yamkani Banda",
                    // onChanged: (value) {},
                    icon: Icons.account_circle_rounded,
                    controller: emailController,
                  ),
                  // username
                  const fieldTitle(title: "Username"),
                  RoundInputField(
                    hintText: "e.g. Yami",
                    // onChanged: (value) {},
                    icon: Icons.account_circle_rounded,
                    controller: emailController,
                  ),
                  // email
                  const fieldTitle(title: "Email"),
                  RoundInputField(
                    hintText: "e.g. Example@test.com",
                    // onChanged: (value) {},
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  //password
                  const fieldTitle(title: "Password"),
                  RoundedPasswordField(
                    // onChanged: (value) {},
                    controller: passwordController,
                  ),
                  //confirm
                  const fieldTitle(title: "Confirm Password"),
                  RoundedPasswordField(
                    // onChanged: (value) {},
                    controller: passwordController,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //sign-in button
              ButtonLoad(
                title: "Sign Up",
                formKey: formKey,
                success: false,
              ),

              //Other options
              const OtherSignInOption(),
            ],
          ),
        ),
      ),
    );
  }
}
