// import 'package:flutter/material.dart';

// class TextFieldReminderWidget extends StatelessWidget {
//   const TextFieldReminderWidget({
//     super.key, required TextEditingController controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const TextField(
//       decoration: InputDecoration(
//         hintText: 'Input Nama Pengingat',
//         labelText: 'Nama Pengingat',
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         border: OutlineInputBorder(
//           // borderRadius: BorderRadius.circular(10.0),
//           // borderSide: const BorderSide(
//           //   color: Colors.black,
//           //   width: 1.5, 
//           // ),
//         ),
//         // focusedBorder: OutlineInputBorder(
//         //   borderRadius: BorderRadius.circular(10.0),
//         //   borderSide: const BorderSide(
//         //     color: Colors.black,
//         //     width: 1.5, 
//         //   ),
//         // ),
//         // enabledBorder: OutlineInputBorder(
//         //   borderRadius: BorderRadius.circular(10.0),
//         //   borderSide: const BorderSide(
//         //     color: Colors.black,
//         //     width: 1.5, 
//         //   ),
//     ));
    
//   }
// }

import 'package:flutter/material.dart';

class TextFieldReminderWidget extends StatefulWidget {
  const TextFieldReminderWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  _TextFieldReminderWidgetState createState() =>
      _TextFieldReminderWidgetState();
}

class _TextFieldReminderWidgetState extends State<TextFieldReminderWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: 'Input Nama Pengingat',
        labelText: 'Nama Pengingat',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
      ),
    );
  }
}
