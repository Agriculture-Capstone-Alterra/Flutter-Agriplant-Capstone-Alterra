import 'package:capstone_project/models/menanam_tanaman_model/plant_by_id_model.dart';
import 'package:capstone_project/providers/pengingat_merawat_tanaman/plant_reminder_provider.dart';
import 'package:capstone_project/services/menanam_tanaman/plant_api.dart';
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
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantReminderProvider>(
      builder: (context, plantReminderProvider, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(plantReminderProvider.TimeMenyiramAppBarText,style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),),
          centerTitle: true,
          ),
          body: ListView(
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
                      // PlantImage plantImage = plantByIdModel.

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
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildItem({
    required dynamic provider,
    required String plantName,
    
  }){
    return Column(
      children: [
        const SizedBox(height: 16,),
        DetailReminder(
          plantName: plantName,
        ),

        const SizedBox(height: 46,),
      ],
    );
  }
}