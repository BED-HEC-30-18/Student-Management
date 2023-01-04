import 'package:flutter/material.dart';
import 'package:student_management_system/view/core/components/input/textFieldContainer.dart';

class RoundedPasswordField extends StatefulWidget {
  // final ValueChanged<String> onChanged;
  var controller;

  RoundedPasswordField({
    Key? key,
    // required this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool secureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: widget.controller,
        // onChanged: widget.onChanged,
        obscureText: secureText,
        showCursor: true,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color: Color.fromARGB(255, 3, 14, 23),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              secureText ? Icons.visibility : Icons.visibility_off,
              color: const Color.fromARGB(255, 3, 14, 23),
            ),
            onPressed: () {
              setState(() {
                secureText = !secureText;
              });
            },
          ),
          hintText: "Password",
          border: InputBorder.none,
          fillColor: Color.fromARGB(26, 207, 218, 227),
          filled: true,
        ),
      ),
    );
  }
}

// class RoundedPasswordField extends StatelessWidget {
//   final controller;
//   const RoundedPasswordField({Key? key, required this.controller})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool secureText = true;
//     return TextFieldContainer(
//       child: TextField(
//         controller: controller,
//         // onChanged: widget.onChanged,
//         obscureText: secureText,
//         showCursor: true,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.lock,
//             color: Color.fromARGB(255, 3, 14, 23),
//           ),
//           suffixIcon: IconButton(
//             icon: Icon(
//               secureText ? Icons.visibility : Icons.visibility_off,
//               color: const Color.fromARGB(255, 3, 14, 23),
//             ),
//             onPressed: () {
//               (() {
//                 secureText = !secureText;
//               });
//             },
//           ),
//           hintText: "Password",
//           border: InputBorder.none,
//           fillColor: Color.fromARGB(26, 207, 218, 227),
//           filled: true,
//         ),
//       ),
//     );
//   }
// }
