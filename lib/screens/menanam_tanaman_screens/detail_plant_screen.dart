import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../providers/plant_provider.dart';

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
            title: Text(plantProvider.AllPlantScreenAppBarText,style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),),
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
