import 'package:capstone_project/models/menanam_tanaman_model/plant_by_id_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantingTools extends StatelessWidget {
  String toolTextHead;
  List plantingToolsList;
  String plantingToolsImage;

  PlantingTools({
    Key? key,
    required this.toolTextHead,
    required this.plantingToolsList,
    required this.plantingToolsImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            toolTextHead,
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
                  children: List<Widget>.generate(plantingToolsList.length, (index){
                    Planting plantingTool = plantingToolsList[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: MediaQuery.of(context).size.width*8/10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey, width: 1),
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
                                plantingTool.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plantingTool.name,
                                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                plantingTool.description,
                                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
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