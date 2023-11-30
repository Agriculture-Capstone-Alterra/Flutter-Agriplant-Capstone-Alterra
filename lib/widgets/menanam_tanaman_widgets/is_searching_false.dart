import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/menanam_tanaman/menanam_tanaman_data.dart';
import '../../models/menanam_tanaman_model/menanam_tanaman_model.dart';

class IsSearchingFalse extends StatefulWidget {
  const IsSearchingFalse({Key? key}) : super(key: key);

  @override
  State<IsSearchingFalse> createState() => _IsSearchingFalseState();
}

class _IsSearchingFalseState extends State<IsSearchingFalse> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 18),
          width: double.infinity,
          child: Text(
            'Jenis Tanaman',
            style: GoogleFonts.inter(
                textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),

        const SizedBox(
          height: 12,
        ),

        // SelectTanaman(),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: menanamList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (_, index) {
              MenanamTanaman menanamTanaman = menanamList[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    menanamTanaman.icon,
                    width: MediaQuery.of(context).size.width / 7,
                    height: MediaQuery.of(context).size.width / 7,
                  ),
                  Text(
                    menanamTanaman.labelIcon,
                    style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              );
            },
          ),
        ),

        const SizedBox(
          height: 32,
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 18),
          width: double.infinity,
          child: Text(
            'Tanaman Terakhir & Rekomendasi Kami',
            style: GoogleFonts.inter(
                textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }
}