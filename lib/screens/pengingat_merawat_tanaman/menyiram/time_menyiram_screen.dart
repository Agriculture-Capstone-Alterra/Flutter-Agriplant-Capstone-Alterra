import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_text_style.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/button/menyiram/button_add_reminder_menyiram_widget.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/card/menyiram/card_time_menyiram_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class TimeMenyiram extends StatefulWidget {
   const TimeMenyiram({Key? key}) : super(key: key);

  @override
  _TimeMenyiramState createState() => _TimeMenyiramState();
}

class _TimeMenyiramState extends State<TimeMenyiram> {
  List<Map<String, dynamic>> reminders = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _getRemindersData();
  }

  Future<void> _getRemindersData() async {
    try {
      final response = await Dio().get(
        "https://6571fd40d61ba6fcc0142a0c.mockapi.io/agriculture/reminder",
      );

      if (response.statusCode == 200) {
        setState(() {
          reminders = List<Map<String, dynamic>>.from(
            response.data.map((dynamic reminder) => reminder as Map<String, dynamic>),
          );
        });
        // Scroll to the bottom after data is fetched
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        print("Failed to fetch reminders. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching reminders: $error");
    }
  }

  //  Future<void> _deleteReminder(String id) async {
  //   try {
  //     final response = await Dio().delete(
  //       "https://6571fd40d61ba6fcc0142a0c.mockapi.io/agriculture/reminder/$id",
  //     );

  //     if (response.statusCode == 200) {
  //       _getRemindersData(); // Refresh the list after deletion
  //     } else {
  //       print("Failed to delete reminder. Status code: ${response.statusCode}");
  //     }
  //   } catch (error) {
  //     print("Error deleting reminder: $error");
  //   }
  // }

  Future<void> _deleteReminder(String id) async {
  bool confirmDelete = false;

  // Show the confirmation dialog
  confirmDelete = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Konfirmasi"),
        content: Text("Apakah Anda yakin ingin menghapus pengingat ini?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // No
            },
            child: Text("Tidak"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Yes
            },
            child: Text("Ya"),
          ),
        ],
      );
    },
  ) ?? false;

  // If the user confirmed, proceed with deletion
  if (confirmDelete) {
    try {
      final response = await Dio().delete(
        "https://6571fd40d61ba6fcc0142a0c.mockapi.io/agriculture/reminder/$id",
      );

      if (response.statusCode == 200) {
        _getRemindersData(); // Refresh the list after deletion
      } else {
        print("Failed to delete reminder. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error deleting reminder: $error");
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "REMINDER MENYIRAM",
          style: ThemeTextStyle().font1,
        ),
        centerTitle: true,
      ),
      body: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Text(
                    "Kangkung",
                    style: ThemeTextStyle().font1,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Text(
                    "Rekomendasi dari kami",
                    style: ThemeTextStyle().font2,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/pengingat_merawat_tanaman/time.png', 
                        height: 24, 
                        width: 24, 
                      ),
                      const SizedBox(width: 8), 
                      Text(
                        "2x Sehari",
                        style: ThemeTextStyle().font3,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Row(
                    children: [
                      const CardTimeMenyiramWidget(),
                      const SizedBox(width: 4), 
                      Text(
                        "AM",
                        style: ThemeTextStyle().font3,
                      ),
                       const SizedBox(width: 16), 
                      Text(
                        "-",
                        style: ThemeTextStyle().font3,
                      ),
                      const SizedBox(width: 16),
                      const CardTimeMenyiramWidget(),
                      const SizedBox(width: 7),
                      Text(
                        "AM",
                        style: ThemeTextStyle().font3,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Row(
                    children: [
                      const CardTimeMenyiramWidget(),
                      const SizedBox(width: 4), 
                      Text(
                        "PM",
                        style: ThemeTextStyle().font3,
                      ),
                       const SizedBox(width: 16), 
                      Text(
                        "-",
                        style: ThemeTextStyle().font3,
                      ),
                      const SizedBox(width: 16),
                      const CardTimeMenyiramWidget(),
                      const SizedBox(width: 7),
                      Text(
                        "PM",
                        style: ThemeTextStyle().font3,
                      ),
                    ],
                  ),
                ),
              ],
            ), 

            // const SizedBox(height: 45),
            // ButtonRekomendasiMenyiram(title: 'Gunakan Rekomendasi',onPressed: () {
            //   print('Button pressed!');
            // }, ),

            const SizedBox(height: 25),
            Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Row(
              children: [
                Text(
                  "Tambahan Pengingat",
                  style: ThemeTextStyle().addReminder,
                ),
                const SizedBox(width: 49),
                ButtonAddReminderMenyiram(
                  onPressed: () {
                    print('Button pressed!');
                  },
                ),
              ],
            ),
          ),
        ],
      ),

          Expanded(
            child: ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    title: Text(reminders[index]["description"]),
                    subtitle: Text(reminders[index]["time"]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteReminder(reminders[index]["id"]);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

            // const SizedBox(height: 274),
            // ButtonSaveReminderMenyiram(title: 'Simpan Reminder',onPressed: () {
            //   print('Button pressed!');
            // }, ),
           

//           ],
//         ),
//       ),
//     );
//   }
// }

//---------

// import 'package:capstone_project/data/text_style/theme_text_style.dart';
// import 'package:flutter/material.dart';
// import '../../../widgets/pengingat_merawat_tanaman/button/menyiram/button_add_reminder_menyiram_widget.dart';
// import '../../../widgets/pengingat_merawat_tanaman/button/menyiram/button_rekomendasi_menyiram_widget.dart';
// import '../../../widgets/pengingat_merawat_tanaman/button/menyiram/button_save_reminder_menyiram_widget.dart';
// import '../../../widgets/pengingat_merawat_tanaman/card/menyiram/card_time_menyiram_widget.dart';

// class TimeMenyiram extends StatelessWidget {
//   const TimeMenyiram({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "REMINDER MENYIRAM",
//           style: ThemeTextStyle().font1,
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 44.0),
//                   child: Text(
//                     "Kangkung",
//                     style: ThemeTextStyle().font1,
//                   ),
//                 ),
//               ],
//             ),
            
//             const SizedBox(height: 13),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 44.0),
//                   child: Text(
//                     "Rekomendasi dari kami",
//                     style: ThemeTextStyle().font2,
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 13),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 44.0),
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         'assets/images/pengingat_merawat_tanaman/time.png', 
//                         height: 24, 
//                         width: 24, 
//                       ),
//                       const SizedBox(width: 8), 
//                       Text(
//                         "2x Sehari",
//                         style: ThemeTextStyle().font3,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 13),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 44.0),
//                   child: Row(
//                     children: [
//                       const CardTimeMenyiramWidget(),
//                       const SizedBox(width: 4), 
//                       Text(
//                         "AM",
//                         style: ThemeTextStyle().font3,
//                       ),
//                        const SizedBox(width: 16), 
//                       Text(
//                         "-",
//                         style: ThemeTextStyle().font3,
//                       ),
//                       const SizedBox(width: 16),
//                       const CardTimeMenyiramWidget(),
//                       const SizedBox(width: 7),
//                       Text(
//                         "AM",
//                         style: ThemeTextStyle().font3,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 13),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 44.0),
//                   child: Row(
//                     children: [
//                       const CardTimeMenyiramWidget(),
//                       const SizedBox(width: 4), 
//                       Text(
//                         "PM",
//                         style: ThemeTextStyle().font3,
//                       ),
//                        const SizedBox(width: 16), 
//                       Text(
//                         "-",
//                         style: ThemeTextStyle().font3,
//                       ),
//                       const SizedBox(width: 16),
//                       const CardTimeMenyiramWidget(),
//                       const SizedBox(width: 7),
//                       Text(
//                         "PM",
//                         style: ThemeTextStyle().font3,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ), 

//             // const SizedBox(height: 45),
//             // ButtonRekomendasiMenyiram(title: 'Gunakan Rekomendasi',onPressed: () {
//             //   print('Button pressed!');
//             // }, ),

//             const SizedBox(height: 25),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 22.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Tambahan Pengingat",
//                         style: ThemeTextStyle().addReminder,
//                       ),
//                        const SizedBox(width: 49), 
//                        ButtonAddReminderMenyiram(onPressed: () {
//                         print('Button pressed!');
//                         }, ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             // const SizedBox(height: 274),
//             // ButtonSaveReminderMenyiram(title: 'Simpan Reminder',onPressed: () {
//             //   print('Button pressed!');
//             // }, ),
           

//           ],
//         ),
//       ),
//     );
//   }
// }