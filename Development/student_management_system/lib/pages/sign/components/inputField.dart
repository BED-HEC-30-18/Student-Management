import 'package:flutter/material.dart';

import 'textFieldContainer.dart';

// class RoundInputField extends StatefulWidget {
//   final String hintText;
//   final IconData icon;
//   final controller;
//   // final ValueChanged<String> onChanged;
//   // var controller;

//   RoundInputField({
//     Key? key,
//     required this.hintText,
//     this.icon = Icons.person,
//     // required this.onChanged,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   State<RoundInputField> createState() => _RoundInputFieldState();
// }

// class _RoundInputFieldState extends State<RoundInputField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFieldContainer(
//       child: TextField(
//         controller: widget.controller,
//         showCursor: true,
//         // onChanged: widget.onChanged,
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             widget.icon,
//             color: const Color.fromARGB(255, 3, 14, 23),
//           ),
//           hintText: widget.hintText,
//           border: InputBorder.none,
//           fillColor: Color.fromARGB(26, 207, 218, 227),
//           filled: true,
//         ),
//       ),
//     );
//   }
// }

class RoundInputField extends StatelessWidget {
  const RoundInputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.icon})
      : super(key: key);

  final String hintText;
  final IconData icon;
  final controller;
  final bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        showCursor: true,
        // onChanged: widget.onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: const Color.fromARGB(255, 3, 14, 23),
          ),
          hintText: hintText,
          border: InputBorder.none,
          fillColor: Color.fromARGB(26, 207, 218, 227),
          filled: true,
        ),
      ),
    );
  }
}
