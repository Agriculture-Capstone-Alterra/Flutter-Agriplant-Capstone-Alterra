import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/plant_by_id_model.dart';

class PlantingGuides extends StatelessWidget {
  String guideTextHead;
  List plantingGuidesList;

  PlantingGuides({
    Key? key,
    required this.guideTextHead,
    required this.plantingGuidesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  children: List<Widget>.generate(plantingGuidesList.length, (index){
                    Planting plantingGuide = plantingGuidesList[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: MediaQuery.of(context).size.width*8/10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey, width: 1)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width/6,
                            width: MediaQuery.of(context).size.width/6,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                plantingGuide.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plantingGuide.name,
                                    style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    plantingGuide.description,
                                    style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(width: 8,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}