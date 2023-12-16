import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_text_style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_color.dart';
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
      width: 32.0,
      height: 32.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ThemeColor().green2Color,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          _showAddReminderMenyiram(context);
        },
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }

void _showAddReminderMenyiram(BuildContext context) async {
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController textFieldController = TextEditingController();

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white, 
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
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  textStyle: ThemeTextStyle().batalkan,
                ),
                child: Text(
                  "Batalkan",
                  style: TextStyle(
                    color: ThemeColor().redColor,
                  ),
                ),
              ),

              TextButton(
                onPressed: () async {
                  String textFieldData = textFieldController.text;
                  String timePickerData = selectedTime.format(context);

                  if (textFieldData.isEmpty) {
                    _showErrorDialog(context, "Deskripsi tidak boleh kosong");
                    return; // Do not proceed further if description is empty
                  }

                  if (timePickerData.isEmpty) {
                    _showErrorDialog(context, "Waktu tidak boleh kosong");
                    return; // Do not proceed further if time is empty
                  }

                  await _postReminderData(textFieldData, timePickerData);

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);

                  // ignore: use_build_context_synchronously
                  _showSuccessMenyiram(context);
                },
                style: TextButton.styleFrom(
                  textStyle: ThemeTextStyle().selesai,
                ),
                child: Text(
                  "Selesai",
                  style: TextStyle(
                    color: ThemeColor().greenColor,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            title: TextFieldReminderWidget(controller: textFieldController),
          ),
          ListTile(
            title: Text(
              "Set Pengingat",
              style: ThemeTextStyle().selesai.copyWith(
                color: ThemeColor().greenColor,
              ),
            ),
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

void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => const AlertDialog(
      title: Text("Tidak boleh kosong"),
    ),
  );
}

void _showSuccessMenyiram(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30.0), 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/pengingat_merawat_tanaman/Centang.png',
              width: 140,
              height: 140,
            ),
          ),

          const SizedBox(height: 30.0), 
          const ListTile(
            title: Text(
              "Berhasil Menyimpan!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 32.0,
              ),
            ),
          ),

          const ListTile(
            title: Text(
              "Selamat kamu sudah berhasil menyimpan pengingat, “dari tanah kami menghidupkan Dunia!!”",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
            ),
          ),
         const SizedBox(height: 10.0), 
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Menutup modal bottom sheet
            },
            child: const Text("Kembali Ke Pengingat"),
          ),
           const SizedBox(height: 40.0), 
        ],
      ),
    ),
  );
}

Future<void> _postReminderData(String textFieldData, String timePickerData) async {
  try {
    final response = await Dio().post(
      "https://6571fd40d61ba6fcc0142a0c.mockapi.io/agriculture/reminder",
      data: {
        "description": textFieldData,
        "time": timePickerData,
      },
    );

    print("Reminder data post response: $response");

    if (response.statusCode == 200) {
      print("Reminder data posted successfully");
    } else {
      print("Failed to post Reminder data. Status code: ${response.statusCode}");
    }
  } catch (error) {
    print("Error posting Reminder data: $error");
  }
}}