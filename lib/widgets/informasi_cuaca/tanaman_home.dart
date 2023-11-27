import 'package:capstone_project/screens/informasi_cuaca/tambah_tanaman.dart';
import 'package:flutter/material.dart';

List<String> imgTanaman = [
  'assets/images/tanaman1.jpg',
  'assets/images/tanaman2.jpg',
  'assets/images/tanaman3.jpg',
  'assets/images/tanaman4.jpg',
  'assets/images/icon_add.png'
];

class TanamanHome extends StatelessWidget {
  const TanamanHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 14),
      child: SizedBox(
        height: 86,
        width: double.maxFinite,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imgTanaman.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SizedBox(
                height: 86,
                width: 86,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgTanaman[index]),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFFD9D9D9),
                  ),
                  child: index == imgTanaman.length - 1
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TambahTanaman(),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 86,
                            width: 86,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.grey,
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        )
                      : Container(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
