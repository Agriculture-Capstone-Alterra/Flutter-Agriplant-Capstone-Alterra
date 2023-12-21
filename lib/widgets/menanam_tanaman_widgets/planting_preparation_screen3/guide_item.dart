import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuideItem extends StatelessWidget {
  Color guideItemColor;
  String guideImage;
  String guideName;
  String guideDesc;

  GuideItem({
    required this.guideItemColor,
    required this.guideImage,
    required this.guideName,
    required this.guideDesc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: guideItemColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/6,
            height: MediaQuery.of(context).size.width/6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(guideImage),
            ),
          ),

          const SizedBox(width: 16,),

          SizedBox(
            width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width / 2.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  guideName,
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  guideDesc,
                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}