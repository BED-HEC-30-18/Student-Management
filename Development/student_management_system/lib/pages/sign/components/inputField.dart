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

class RoundInputField extends StatefulWidget {
  const RoundInputField({
    Key? key,
    this.controller,
    required this.hintText,
    required this.icon,
    required this.currentNode,
    required this.nextNode,
    this.onChangedField,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final controller;
  final FocusNode currentNode;
  final FocusNode nextNode;
  final ValueChanged? onChangedField;

  @override
  State<RoundInputField> createState() => _RoundInputFieldState();
}

class _RoundInputFieldState extends State<RoundInputField> {
  final bool obscure = false;

  // @override
  // void initState() {
  //   super.initState();

  //   widget.controller.addListener(onListen);
  // }

  // @override
  // void dispose() {
  //   super.dispose();

  //   widget.controller.removeListener(onListen);
  // }

  // void onListen() => setState(() {});

  void editingComplete() {
    print("editing complete");
    FocusScope.of(context).requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: widget.onChangedField,
        controller: widget.controller,
        focusNode: widget.currentNode,
        showCursor: true,
        // onChanged: widget.onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: const Color.fromARGB(255, 3, 14, 23),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.close,
              color: const Color.fromARGB(255, 3, 14, 23),
            ),
            onPressed: () => widget.controller.clear(),
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
          fillColor: Color.fromARGB(26, 207, 218, 227),
          filled: true,
        ),
        onEditingComplete: editingComplete,
      ),
    );
  }
}
