import 'package:flutter/material.dart';
import 'package:capstone_project/data/theme_color.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/text_field/text_field_reminder_widget.dart';

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

  void _showAddReminderMenyiram(BuildContext context) async {
  TimeOfDay selectedTime = TimeOfDay.now();

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);                },
                child: const Text("Batalkan"),
              ),
              TextButton(
                onPressed: () {
                },
                child: const Text("Selesai"),
              ),
            ],
          ),
          const ListTile(
            title: TextFieldReminderWidget(),
          ),
          ListTile(
            title: const Text("Set Pengingat"),
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: selectedTime,
                initialEntryMode: TimePickerEntryMode.input,
              );

              if (pickedTime != null && pickedTime != selectedTime) {
                selectedTime = pickedTime;
              }
            },
          ),
        ],
      ),
    ),
  );
}
}