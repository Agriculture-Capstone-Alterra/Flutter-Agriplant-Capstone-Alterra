import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SearchAllPlant extends StatefulWidget {
  Icon icon;
  TextEditingController searchAllPlantController = TextEditingController();
  String searchAllPlantHint;
  Function() onChanged;
  
  SearchAllPlant({
    Key? key,
    required this.icon,
    required this.searchAllPlantController,
    required this.searchAllPlantHint,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SearchAllPlant> createState() => _SearchAllPlantState();
}

class _SearchAllPlantState extends State<SearchAllPlant> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.searchAllPlantController,
              decoration: InputDecoration(
                  hintText: widget.searchAllPlantHint,
                  hintStyle: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 12, color: Colors.black)),
                  border: InputBorder.none
              ),
            ),
          ),
          widget.icon,
        ],
      ),
    );
  }
}
