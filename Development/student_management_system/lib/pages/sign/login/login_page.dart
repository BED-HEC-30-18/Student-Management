import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_management_system/components/button/barButton.dart';
import 'package:student_management_system/components/button/loadButton.dart';
import 'package:student_management_system/pages/sign/components/fieldTitle.dart';
import 'package:student_management_system/pages/sign/components/inputField.dart';
import 'package:student_management_system/pages/sign/components/otherSignOptions.dart';
import 'package:student_management_system/pages/sign/components/passwordField.dart';
import 'package:student_management_system/pages/sign/components/signInUpBtn.dart';
import 'package:student_management_system/pages/sign/register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Sign-up button
                SignInOrSignUp(
                  title: 'Sign Up ',
                  destination: RegisterPage(),
                ),
                // Greetings section
                Container(
                  width: size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Hello Again!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                        child: Image.asset(
                          "assets/images/Logo.png",
                          width: size.width * 0.45,
                        ),
                      ),
                      const Text(
                        "Welcome back to your Student Management System!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                //textfields
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // email
                    fieldTitle(title: "Email"),
                    RoundInputField(
                      hintText: "e.g. Example@test.com",
                      // onChanged: (value) {},
                      icon: Icons.email,
                      controller: emailController,
                    ),
                    //password
                    fieldTitle(title: "Password"),
                    RoundedPasswordField(
                      // onChanged: (value) {},
                      controller: passwordController,
                    ),
                    Container(
                      width: size.width * 0.9,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 2, 148, 252),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'forgot password?',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //sign-in button
                // ButtonLoad(
                //   title: "Sign In",
                //   formKey: formKey,
                // ),

                // BarButton(
                //   title: "Sign in",
                //   onChanged: signIn,
                // ),
                GestureDetector(
                  onTap: signIn,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.deepPurple),
                    child: Text("Sign IN"),
                  ),
                ),

                //Other options
                OtherSignInOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
