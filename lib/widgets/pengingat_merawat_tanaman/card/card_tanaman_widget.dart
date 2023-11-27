import 'package:flutter/material.dart';
import 'package:capstone_project/data/text_style/theme_text_style.dart';

class CardTanamanWidget extends StatelessWidget {
  const CardTanamanWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCard('assets/images/pengingat_merawat_tanaman/bayam.png', 'Bayam'),
            _buildCard('assets/images/pengingat_merawat_tanaman/seledri.png', 'Seledri'),
            _buildCard('assets/images/pengingat_merawat_tanaman/kangkung.png', 'Kangkung'),
          ],
        ),
        const SizedBox(height: 30), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCard('assets/images/pengingat_merawat_tanaman/pakcoy.png', 'Pakcoy'),
            _buildCard('assets/images/pengingat_merawat_tanaman/brokoli.png', 'Brokoli'),
            _buildCard('assets/images/pengingat_merawat_tanaman/buncis.png', 'Buncis'),
          ],
        ),
        const SizedBox(height: 30), 
       Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCard('assets/images/pengingat_merawat_tanaman/bayam.png', 'Bayam'),
            _buildCard('assets/images/pengingat_merawat_tanaman/seledri.png', 'Seledri'),
            _buildCard('assets/images/pengingat_merawat_tanaman/kangkung.png', 'Kangkung'),
          ],
        ),
        const SizedBox(height: 30), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCard('assets/images/pengingat_merawat_tanaman/pakcoy.png', 'Pakcoy'),
            _buildCard('assets/images/pengingat_merawat_tanaman/brokoli.png', 'Brokoli'),
            _buildCard('assets/images/pengingat_merawat_tanaman/buncis.png', 'Buncis'),
          ],
        ),
        const SizedBox(height: 30), 
       Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCard('assets/images/pengingat_merawat_tanaman/bayam.png', 'Bayam'),
            _buildCard('assets/images/pengingat_merawat_tanaman/seledri.png', 'Seledri'),
            _buildCard('assets/images/pengingat_merawat_tanaman/kangkung.png', 'Kangkung'),
          ],
        ),
      ],
    );
  }

  Widget _buildCard(String imagePath, String plantName) {
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
              Image.asset(
                imagePath,
                 width: 100,
              ),
              const SizedBox(height: 5),
              Text(
                plantName,
                style: ThemeTextStyle().tanaman,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
