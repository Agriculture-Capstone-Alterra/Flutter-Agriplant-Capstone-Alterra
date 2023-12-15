import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantingGuides extends StatelessWidget {
  String guideTextHead;

  PlantingGuides({
    Key? key,
    required this.guideTextHead
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            guideTextHead,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(height: 6,),

        IntrinsicHeight(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 8,),
                Wrap(
                  children: List<Widget>.generate(3, (index){
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      padding: EdgeInsets.only(top: 8, left: 0, right: 8, bottom: 8,),
                      width: MediaQuery.of(context).size.width*8/10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey, width: 1)
                      ),
                      child: Row(
                        children: [
                          Text('image'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tahap 1',
                                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'penjelasan tahap 1',
                                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}