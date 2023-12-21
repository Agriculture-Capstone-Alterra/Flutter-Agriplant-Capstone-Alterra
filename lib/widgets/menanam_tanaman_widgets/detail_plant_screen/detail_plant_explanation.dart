import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DetailPlantExplanation extends StatelessWidget {
  Color aboutPlantColor;
  String plantName;
  String aboutPlant;
  String plantType;
  String technology;
  String variety;
  String jenisTanamanIcon;
  String techIcon;
  String varietyIcon;

  DetailPlantExplanation({
    Key? key,
    required this.aboutPlantColor,
    required this.plantName,
    required this.aboutPlant,
    required this.plantType,
    required this.technology,
    required this.variety,
    required this.jenisTanamanIcon,
    required this.techIcon,
    required this.varietyIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plantName,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8,),
              Text(
                aboutPlant,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              width: MediaQuery.of(context).size.width/3.5,
              height: MediaQuery.of(context).size.width/3.5,
              decoration: BoxDecoration(
                color: aboutPlantColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(jenisTanamanIcon),
                  Text(
                    'Jenis Tanaman',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    plantType,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              width: MediaQuery.of(context).size.width/3.5,
              height: MediaQuery.of(context).size.width/3.5,
              decoration: BoxDecoration(
                color: aboutPlantColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(techIcon),
                  Text(
                    'Teknologi',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    technology,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              width: MediaQuery.of(context).size.width/3.5,
              height: MediaQuery.of(context).size.width/3.5,
              decoration: BoxDecoration(
                color: aboutPlantColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(varietyIcon),
                  Text(
                    'Varietas',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    variety,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}