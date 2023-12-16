import 'package:flutter/material.dart';

class CardTimeMenyiramWidget extends StatelessWidget {
  const CardTimeMenyiramWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide( 
          color: Colors.black, 
          width: 1.0, 
        ),
      ),
      child: const SizedBox(
        width: 60,
        height: 30,
      ),
    );
  }
}
