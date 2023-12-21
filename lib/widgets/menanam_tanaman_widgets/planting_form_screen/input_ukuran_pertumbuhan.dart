import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputUkuranPertumbuhan extends StatelessWidget {
  String inputUkuranPertumbuhanTextHead;
  Color formTextColor;
  Color formBorderColor;
  String radio1TitleText;
  String radio2TitleText;
  String radio3TitleText;
  String radioValue;
  String inputUkuranPertumbuhanWarntext;
  Function(dynamic value) onChangedRadioValue;

  InputUkuranPertumbuhan({
    Key? key,

    required this.inputUkuranPertumbuhanTextHead,
    required this.formTextColor,
    required this.formBorderColor,
    required this.radio1TitleText,
    required this.radio2TitleText,
    required this.radio3TitleText,
    required this.radioValue,
    required this.inputUkuranPertumbuhanWarntext,
    required this.onChangedRadioValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: formBorderColor, width: 1),
          ),
          child: ExpansionTile(
            title: Text(
              inputUkuranPertumbuhanTextHead,
              style: GoogleFonts.inter(
                fontSize: 12, fontWeight: FontWeight.w700, color: formTextColor
              ),
            ),
            children: [
              Container(
                width: double.infinity,
                child: Column(children: [
                  RadioListTile(
                    value: radio1TitleText,
                    groupValue: radioValue,
                    title: Text(
                      radio1TitleText,
                      style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    onChanged: onChangedRadioValue,
                  ),

                  RadioListTile(
                    value: radio2TitleText,
                    groupValue: radioValue,
                    title: Text(
                      radio2TitleText,
                      style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    onChanged: onChangedRadioValue,
                  ),

                  RadioListTile(
                    value: radio3TitleText,
                    groupValue: radioValue,
                    title: Text(
                      radio3TitleText,
                      style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    onChanged: onChangedRadioValue,
                  ),
                ]),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 4,
        ),

        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15,),
          child: Text(
            inputUkuranPertumbuhanWarntext,
            style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: formBorderColor),
          ),
        ),
      ],
    );
  }
}
