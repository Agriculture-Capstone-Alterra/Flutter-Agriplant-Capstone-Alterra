import 'package:capstone_project/data/theme_color.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/testing/timepicker.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/text_field/text_field_reminder_widget.dart';
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
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Batalkan'),
                ),
                // const SizedBox(width: 80.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Selesai'),
                ),
              ],
            ),

            const ListTile(
              title: TextFieldReminderWidget(),
            ),
            const ListTile(
              title: NumberPage(),
            ),
            // Add more options as needed
          ],
        );
      },
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Do something with the picked time
      print('Selected Time: ${pickedTime.format(context)}');
    }
  }
}
