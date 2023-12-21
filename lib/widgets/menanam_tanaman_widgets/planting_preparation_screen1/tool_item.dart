import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ToolItem extends StatelessWidget {
  Color toolItemColor;
  String toolImage;
  String toolName;
  String toolDesc;

  ToolItem({
    required this.toolItemColor,
    required this.toolImage,
    required this.toolName,
    required this.toolDesc,
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
        color: toolItemColor,
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/6,
            height: MediaQuery.of(context).size.width/6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(toolImage),
            ),
          ),

          const SizedBox(width: 16,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                toolName,
                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                toolDesc,
                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}