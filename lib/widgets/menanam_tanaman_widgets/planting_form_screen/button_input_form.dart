import 'package:flutter/material.dart';

class ButtonInputForm extends StatefulWidget {
  const ButtonInputForm({Key? key}) : super(key: key);

  @override
  State<ButtonInputForm> createState() => _ButtonInputFormState();
}

class _ButtonInputFormState extends State<ButtonInputForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.deepPurple,
        ),
        child: Center(child: Text('Tanam')),
      ),
    );
  }
}
