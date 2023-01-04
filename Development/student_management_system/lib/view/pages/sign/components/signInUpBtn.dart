import 'package:flutter/material.dart';

class SignInOrSignUp extends StatefulWidget {
  SignInOrSignUp({
    Key? key,
    required this.destination,
    required this.title,
  }) : super(key: key);

  final String title;
  var destination;

  @override
  State<SignInOrSignUp> createState() => _SignInOrSignUpState();
}

class _SignInOrSignUpState extends State<SignInOrSignUp> {
  gotonextpage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget.destination;
    }));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width * 0.95,
          alignment: Alignment.centerRight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Material(
              child: InkWell(
                onTap: gotonextpage,
                highlightColor: Color.fromARGB(255, 144, 227, 244),
                splashColor: Color.fromARGB(255, 144, 227, 244),
                child: Ink(
                  width: 100,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 26, 143, 227),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
// TextButton(
//                   style: TextButton.styleFrom(
//                     textStyle: const TextStyle(fontSize: 20),
//                   ),
//                   onPressed: 
//                   child: Container(
//                     width: 100,
//                     height: 25,
                    
//                   ),
//                 ),
