import 'package:capstone_project/data/home_text_style.dart';
import 'package:capstone_project/screens/navigation_bar.dart';
import 'package:flutter/material.dart';

List<String> imgBackground = [
  'assets/images/rain.jpg',
  'assets/images/sky.jpg'
];

List<String> kota = ['Jakarta Selatan, ID', 'Bogor, ID'];

class KotaCuaca extends StatefulWidget {
  const KotaCuaca({super.key});

  @override
  State<KotaCuaca> createState() => _KotaCuacaState();
}

class _KotaCuacaState extends State<KotaCuaca> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 242,
      width: 360,
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavBar(),
                    ),
                  );
                },
                child: SizedBox(
                  width: 360,
                  height: 108,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imgBackground[index]),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BodyLarge(
                                  text: kota[index],
                                  color: Colors.black,
                                ),
                                BodyLarge(
                                  text: '27°C',
                                  color: Colors.black,
                                  size: 32,
                                ),
                              ],
                            ),
                          ),
                          BodyNormal(text: '13.10'),
                          const SizedBox(
                            height: 14,
                          ),
                          BodySmall(text: 'Hujan Deras')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
