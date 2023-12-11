import 'package:flutter/material.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('splash screen 1'),
        ),
      ),
    );
  }
}