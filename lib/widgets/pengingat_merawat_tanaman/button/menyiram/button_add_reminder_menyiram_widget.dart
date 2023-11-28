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
                  Navigator.pop(context);
                },
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
            title: const Text("Pilih Waktu"),
            trailing: const Icon(Icons.access_time),
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: selectedTime,
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


//   void _showAddReminderMenyiram(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//             Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('Batalkan'),
//                 ),
//                 // const SizedBox(width: 80.0), 
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 child: const Text('Selesai'),
//                 ),
//               ],
//             ),
              
//           const ListTile(
//             title: TextFieldReminderWidget(), 
//           ),
//           // const ListTile(
//           //   title: NumberPage(), 
//           // ),
//             ListTile(
//               subtitle: InkWell(
//                 onTap: () {
//                   _selectTime(context);
//                 },
//                 child: const Row(
//                   children: <Widget>[
//                     SizedBox(width: 8.0),
//                     Text('Select Time'),
//                   ],
//                 ),
//               ),
//             ),
//             //Add more options as needed
//           ],
//         );
//       },
//     );
//   }


//   Future<void> _selectTime(BuildContext context) async {
//     TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );

//     if (pickedTime != null) {
//       // Do something with the picked time
//       print('Selected Time: ${pickedTime.format(context)}');
//     }
//   }
// }
