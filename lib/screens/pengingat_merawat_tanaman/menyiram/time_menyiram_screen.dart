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
      } else {
        print("Failed to fetch reminders. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching reminders: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REMINDER MENYIRAM",
          style: ThemeTextStyle().font1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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

Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10.0),
                
                SizedBox(
                  height: 150.0, // Adjust the height as needed
                  child: ListView.builder(
                    itemCount: reminders.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(reminders[index]["description"]),
                        subtitle: Text(reminders[index]["time"]),
                      );
                    },
                  ),
                ),
              ],
            )
          ] 
          // const SizedBox.shrink(),
        )
      )
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