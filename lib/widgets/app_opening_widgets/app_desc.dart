import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppDesc extends StatelessWidget {
  PageController pageController;
  String image;
  String featureName;
  String featureDesc;
  Color colorFeatureText;
  Color buttonColor;
  String buttonText;
  Color buttonTextColor;
  Function() changeView;
  String skipText;
  Color skipTextColor;
  Function() skipToPage;

  AppDesc({
    Key? key,
    required this.pageController,
    required this.image,
    required this.featureName,
    required this.featureDesc,
    required this.colorFeatureText,
    required this.buttonColor,
    required this.buttonText,
    required this.buttonTextColor,
    required this.changeView,
    required this.skipText,
    required this.skipTextColor,
    required this.skipToPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(image, fit: BoxFit.cover),
        ),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                featureName,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  color: colorFeatureText,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 42),
                width: double.infinity,
                child: Text(
                  featureDesc,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: colorFeatureText,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    buttonText,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onTap: changeView,
              ),
              const SizedBox(
                height: 44,
              )
            ],
          ),
        ),

        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 26, right: 14),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Text(
                skipText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: skipTextColor,
                ),
              ),
            ),
            onTap: skipToPage,
          ),
        ),
      ],
    );
  }
}
