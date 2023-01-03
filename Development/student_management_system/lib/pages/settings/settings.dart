// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:student_management_system/components/button/barButton.dart';
import 'package:student_management_system/components/title/titlebar.dart';
import 'package:student_management_system/pages/sign/components/logout.dart';

class SettingPage extends StatelessWidget {
  SettingPage({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isDrawerOpen
          ? MainSection(isDrawerOpen: isDrawerOpen)
          : SafeArea(
              child: MainSection(isDrawerOpen: isDrawerOpen),
            ),
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({
    Key? key,
    required this.isDrawerOpen,
  }) : super(key: key);

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TitleBar(
          title: "Settings",
          isDrawerOpen: isDrawerOpen,
        ),
        Container(
          width: size.width,
          child: Column(
            children: const [
              SettingOption(
                title: "Profile",
                icon: Icons.account_circle_rounded,
              ),
              SettingOption(
                title: "Notifications",
                icon: Icons.notifications_rounded,
              ),
              SettingOption(
                title: "Feedback and Support",
                icon: Icons.mail_rounded,
              ),
              SettingOption(
                title: "Rate the App",
                icon: Icons.star_rate_rounded,
              ),
              SettingOption(
                title: "Licenses",
                icon: Icons.newspaper_rounded,
              ),
              SettingOption(
                title: "About",
                icon: Icons.info_rounded,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Logout(),
        // GestureDetector(
        //   onTap: () {
        //     FirebaseAuth.instance.signOut();
        //   },
        //   child: Container(
        //     decoration: BoxDecoration(color: Colors.deepPurple),
        //     child: Text("Sign out"),
        //   ),
        // ),
      ],
    );
  }
}

class SettingOption extends StatelessWidget {
  const SettingOption({
    Key? key,
    required this.title,
    this.icon = Icons.person,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: 80,
                child: Icon(
                  icon,
                  size: 28,
                  color: const Color.fromARGB(255, 3, 14, 23),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: size.width - 80,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Color.fromARGB(255, 3, 14, 23),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: const Color.fromARGB(63, 3, 14, 23),
          height: 3,
          indent: 80,
        ),
      ],
    );
  }
}
