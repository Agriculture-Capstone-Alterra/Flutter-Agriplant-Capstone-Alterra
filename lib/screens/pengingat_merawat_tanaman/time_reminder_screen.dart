import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_text_style.dart';
import 'package:capstone_project/models/plant_by_id_model.dart';
import 'package:capstone_project/providers/plant_reminder_provider.dart';
import 'package:capstone_project/services/pengingat_merawat_tanaman/reminder_time_api.dart';
import 'package:capstone_project/services/menanam_tanaman/plant_api.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/button/button_add_reminder_widget.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/button/button_tidak_widget.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/button/button_ya_widget.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/card/card_time_menyiram_widget.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/card/card_timeee_menyiram_widget.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/detail_reminder_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimeReminder extends StatefulWidget {
   const TimeReminder({Key? key}) : super(key: key);

  @override
  State<TimeReminder> createState() => _TimeReminderState();
}

class _TimeReminderState extends State<TimeReminder> {
  List<Map<String, dynamic>> reminders = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _getRemindersData();
  }

  // ignore: unused_field
  final ReminderTimeAPI _reminderTimeAPI = ReminderTimeAPI();

  Future<void> _getRemindersData() async {
    try {
      final reminders = await _reminderTimeAPI.getReminders();
    
      setState(() {
        this.reminders = reminders;
      });

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } catch (error) {
    // ignore: avoid_print
    print("Error fetching reminders: $error");
    }
  }

  Future<void> _deleteReminder(String id) async {
  bool confirmDelete = false;

  //Alert Dialog Delete
  confirmDelete = await showDialog<bool>(
  context: context,
  builder: (BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        dialogBackgroundColor: Colors.white,
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), 
          ),
        ),
      ),
        child: AlertDialog(
          title: Text(
            "Yakin ingin menghapus pengingat?",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 20.0, 
              fontWeight: FontWeight.w600, 
              color: Colors.black, 
            ),
          ),
          content: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
             ButtonYaWidget(
              title: 'Ya',
              onPressed: () {
                Navigator.of(context).pop(true);
              },
             ),
             ButtonTidakWidget(
              title: 'Tidak',
              onPressed: () {
                Navigator.of(context).pop(false);
              },
             ),
            ],
          ),
        ),
      );
    },
  ) ?? false;

   if (confirmDelete) {
      await _reminderTimeAPI.deleteReminder(id);
      _getRemindersData(); 
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantReminderProvider>(
      builder: (context, plantReminderProvider, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(plantReminderProvider.TimeMenyiramAppBarText,style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),),
            centerTitle: true,
          ),
          body: Column(
            children: [
              StreamBuilder(
                stream: Stream.fromFuture(PlantApi().getPlantById(id: plantReminderProvider.idPlant)),
                builder: (_, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }else if (snapshot.hasData) {
                    // Memeriksa apakah data yang diterima memiliki struktur yang sesuai
                    if (snapshot.data != null){
                      // ignore: unnecessary_cast
                      PlantByIdModel plantByIdModel = snapshot.data! as PlantByIdModel;
                      PlantByIdData plantByIdData = plantByIdModel.data;
                      return buildItem(
                        provider: plantReminderProvider,
                        plantName: plantByIdData.name);
                    }else {
                      return const Center(child: Text('Data tidak valid.'));
                    }
                  } else {
                    return const Center(child: Text('Tidak ada data.'));
                  }
                }
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
                      const CardTimeeeeMenyiramWidget(),
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
                      const CardTimeeeeMenyiramWidget(),
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
                          // ignore: avoid_print
                          print('Button pressed!');
                        },
                        ) ,
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
                    color: const Color(0xFFFFFFFF), 
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 13.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 25.0),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            reminders[index]["time"],
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF646E82),
                            ),
                          ),
                          Text(
                            reminders[index]["description"],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF646E82),
                            ),
                          ),
                        ],
                      ),

                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red, 
                        ),
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
  );
}}
  
Widget buildItem({
    required dynamic provider,
    required String plantName,
  }){
    return Column(
      children: [
        const SizedBox(height: 12,),
        DetailReminder(
          plantName: plantName,
        ),
      ],
    );
  }