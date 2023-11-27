import 'package:capstone_project/data/theme_color.dart';
import 'package:flutter/material.dart';

class ButtonAddReminderMenyiram extends StatelessWidget {
  final Function()? onPressed;

  const ButtonAddReminderMenyiram({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35.0,
      height: 35.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ThemeColor().greenColor,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          // Display the bottom sheet when the button is pressed
          _showAddReminderMenyiram(context);
        },
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 25.0,
          ),
        ),
      ),
    );
  }

  void _showAddReminderMenyiram(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Customize the appearance of your bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Text Field'),
                onTap: () {
                  // Handle option 1
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Time Picker'),
                onTap: () {
                  // Handle option 2
                  Navigator.pop(context);
                },
              ),
              // Add more options as needed
            ],
          ),
        );
      },
    );
  }
}
