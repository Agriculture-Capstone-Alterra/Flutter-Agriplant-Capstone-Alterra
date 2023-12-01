import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/menanam_tanaman/menanam_tanaman_data.dart';
import '../../models/menanam_tanaman_model/menanam_tanaman_model.dart';

class SelectTanaman extends StatefulWidget {
  const SelectTanaman({Key? key}) : super(key: key);

  @override
  State<SelectTanaman> createState() => _SelectTanamanState();
}

class _SelectTanamanState extends State<SelectTanaman> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: menanamList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (_, index){
          MenanamTanaman menanamTanaman = menanamList[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                menanamTanaman.icon,
                width: MediaQuery.of(context).size.width/7,
                height: MediaQuery.of(context).size.width/7,
              ),
              Text(menanamTanaman.labelIcon, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),),
            ],
          );
        },
      ),
    );
  }
}
