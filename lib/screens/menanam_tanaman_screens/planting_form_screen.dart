import 'package:capstone_project/providers/plant_provider.dart';
import 'package:capstone_project/services/menanam_tanaman/plant_api.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/plant_image_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/menanam_tanaman_model/plant_by_id_model.dart';

class PlantingFormScreen extends StatefulWidget {
  const PlantingFormScreen({Key? key}) : super(key: key);

  @override
  State<PlantingFormScreen> createState() => _PlantingFormScreenState();
}

class _PlantingFormScreenState extends State<PlantingFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantProvider>(
      builder: (context, plantProvider, child){
        return Scaffold(
          appBar: AppBar(),
          body: StreamBuilder(
            stream: Stream.fromFuture(PlantApi().getPlantById(id: plantProvider.idPlant)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                // Memeriksa apakah data yang diterima memiliki struktur yang sesuai
                if (snapshot.data != null) {
                  PlantByIdModel plantByIdModel = snapshot.data! as PlantByIdModel;
                  PlantByIdData plantByIdData = plantByIdModel.data;
                  return buildItem(
                    provider: plantProvider,
                    plantImage: plantByIdData.plantImageThumbnail,
                  );
                } else {
                  return Center(child: Text('Data tidak valid.'));
                }
              } else {
                return Center(child: Text('Tidak ada data.'));
              }
            },
          ),
        );
      },
    );
  }

  Widget buildItem({
    required dynamic provider,
    required String plantImage,

  }){
    return ListView(
      children: [
        PlantImageForm(image: plantImage),
        const SizedBox(height: 20,),
        Text('nama tanaman'),
        const SizedBox(height: 14,),
        //form input pengukuran
        Text('Mohon isi data terlebih dahulu'),
        const SizedBox(height: 10,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: TextFormField(
            controller: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              hintText: 'input',
              label: Text('Jumlah Bibit')
            ),
          ),
        ),
        const SizedBox(height: 4,),
        Text('Masukan jumlah bibit yang akan ditanam'),
        const SizedBox(height: 18,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: ExpansionTile(
            title: Text('Mengukur Pertumbuhan'),
            children: [
              Container(
                width: double.infinity,
                color: Colors.grey,
                child: Column(
                  children: [
                    Text('Berat'),
                    Text('Tinggi'),
                    Text('Jumlah'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4,),
        Text('Pilih pengukuran yang sesuai untuk tanaman'),
        const SizedBox(height: 18,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: null,
                  enabled: false,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                    hintText: 'input',
                    label: Text('Tanggal menanam'),
                  ),
                ),
              ),
              Icon(Icons.calendar_today_sharp)
            ],
          ),
        ),
        const SizedBox(height: 25,),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width/2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.deepPurple,
            ),
            child: Center(child: Text('Tanam')),
          ),
        )
      ],
    );
  }
}