import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SearchTanaman extends StatefulWidget {
  Icon icon;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode;
  String searchHinText;
  bool enableSearch;
  Function() formOnTap;

  SearchTanaman({
    Key? key,
    required this.icon,
    required this.searchController,
    required this.searchFocusNode,
    required this.searchHinText,
    required this.enableSearch,
    required this.formOnTap,
  }) : super(key: key);

  @override
  State<SearchTanaman> createState() => _SearchTanamanState();
}

class _SearchTanamanState extends State<SearchTanaman> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
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
                controller: widget.searchController,
                decoration: InputDecoration(
                    hintText: widget.searchHinText,
                    hintStyle: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 12, color: Colors.black)),
                    border: InputBorder.none
                ),
                autofocus: true,
                focusNode: widget.searchFocusNode,
                enabled: widget.enableSearch,
                // readOnly: widget.enableSearch,
                // onTap: (){widget.onTap();},
              ),
            ),
            widget.icon,
          ],
        ),
      ),
      onTap: (){
        widget.formOnTap();
      },
    );
  }
}