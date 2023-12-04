// import 'package:flutter/material.dart';
// import 'package:capstone_project/data/text_style/theme_text_style.dart';

// class CardTanamanWidget extends StatelessWidget {
//   const CardTanamanWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildCard('assets/images/pengingat_merawat_tanaman/bayam.png', 'Bayam'),
//             _buildCard('assets/images/pengingat_merawat_tanaman/seledri.png', 'Seledri'),
//             _buildCard('assets/images/pengingat_merawat_tanaman/kangkung.png', 'Kangkung'),
//           ],
//         ),
//         const SizedBox(height: 30), 
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildCard('assets/images/pengingat_merawat_tanaman/pakcoy.png', 'Pakcoy'),
//             _buildCard('assets/images/pengingat_merawat_tanaman/brokoli.png', 'Brokoli'),
//             _buildCard('assets/images/pengingat_merawat_tanaman/buncis.png', 'Buncis'),
//           ],
//         ),
//         const SizedBox(height: 30), 
//        Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildCard('assets/images/pengingat_merawat_tanaman/bayam.png', 'Bayam'),
//             _buildCard('assets/images/pengingat_merawat_tanaman/seledri.png', 'Seledri'),
//             _buildCard('assets/images/pengingat_merawat_tanaman/kangkung.png', 'Kangkung'),
//           ],
//         ),
//         const SizedBox(height: 30), 
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildCard('assets/images/pengingat_merawat_tanaman/pakcoy.png', 'Pakcoy'),
//             _buildCard('assets/images/pengingat_merawat_tanaman/brokoli.png', 'Brokoli'),
//             _buildCard('assets/images/pengingat_merawat_tanaman/buncis.png', 'Buncis'),
//           ],
//         ),
//         const SizedBox(height: 30), 
//        Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildCard('assets/images/pengingat_merawat_tanaman/bayam.png', 'Bayam'),
//             _buildCard('assets/images/pengingat_merawat_tanaman/seledri.png', 'Seledri'),
//             _buildCard('assets/images/pengingat_merawat_tanaman/kangkung.png', 'Kangkung'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildCard(String imagePath, String plantName) {
//     return Card(
//       color: Colors.white,
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: SizedBox(
//         width: 94,
//         height: 75,
//         child: Padding(
//           padding: const EdgeInsets.all(0.0),
//           child: Column(
//             children: [
//               Image.asset(
//                 imagePath,
//                  width: 100,
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 plantName,
//                 style: ThemeTextStyle().tanaman,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:capstone_project/models/pengingat_merawat_tanaman/plant_list_model.dart';
import 'package:capstone_project/services/pengingat_merawat_tanaman/plant_list_api.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project/data/text_style/theme_text_style.dart';

class CardTanamanWidget extends StatefulWidget {
  const CardTanamanWidget({Key? key}) : super(key: key);

  @override
  _CardTanamanWidgetState createState() => _CardTanamanWidgetState();
}

class _CardTanamanWidgetState extends State<CardTanamanWidget> {
  late List<PlantData> plantData = []; 

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Replace 'YOUR_API_BASE_URL' with the actual base URL of your API
      final plantApiClient = PlantApiClient(baseUrl: 'https://service.api-agriplant.xyz', bearerToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE3MzMyMjgxMzQsInJvbGUiOiJBZG1pbiIsInVzZXJJZCI6MX0.b0Jh9cbZIwA6jssoNmafu0vtt2_baJdDxpiH2c1I9Hk');
      final data = await plantApiClient.fetchPlantData();

      setState(() {
        plantData = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
Widget build(BuildContext context) {
  return plantData.isNotEmpty
      ? Column(
          children: plantData.map((data) => _buildCard(data)).toList(),
        )
      : CircularProgressIndicator();
}


  Widget _buildCard(PlantData plantData) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 94,
        height: 75,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              // Image.network(
              //   plantData.plantImageThumbnail,
              //   width: 100,
              // ),
              const SizedBox(height: 5),
              Text(
                plantData.name,
                style: ThemeTextStyle().tanaman,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
