import 'package:capstone_project/providers/pengingat_merawat_tanaman.dart/plant_list_reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPlant extends StatefulWidget {
  const DetailPlant({Key? key}) : super(key: key);

  @override
  State<DetailPlant> createState() => _DetailPlantState();
}

class _DetailPlantState extends State<DetailPlant> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantProvider>(
      builder: (context, plantProvider, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(plantProvider.AllPlantScreenAppBarText),
          ),
          body: ListView(
            children: [
              Center(child: Text('detail plant'),)
            ],
          ),
        );
      },
    );
  }
}
