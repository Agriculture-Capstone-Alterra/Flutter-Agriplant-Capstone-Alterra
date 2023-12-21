import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PlantTimes extends StatelessWidget {
  String headText;
  String subHeadKemarau;
  String subHeadHujan;
  String drySeasonStartPlant;
  String drySeasonFinishPlant;
  String rainySeasonStartPlant;
  String rainySeasonFinishPlant;

  PlantTimes({Key? key,
    required this.headText,
    required this.subHeadKemarau,
    required this.subHeadHujan,
    required this.drySeasonStartPlant,
    required this.drySeasonFinishPlant,
    required this.rainySeasonStartPlant,
    required this.rainySeasonFinishPlant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headText,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subHeadKemarau,
                      style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w700
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_month),
                        Text(
                          '$drySeasonStartPlant - $drySeasonFinishPlant',
                          style: GoogleFonts.inter(
                            fontSize: 12, fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subHeadHujan,
                      style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_month),
                        Text(
                          '$rainySeasonStartPlant - $rainySeasonFinishPlant',
                          style: GoogleFonts.inter(
                            fontSize: 12, fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
