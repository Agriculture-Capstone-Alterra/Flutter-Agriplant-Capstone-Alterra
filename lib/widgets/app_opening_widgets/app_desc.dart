import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDesc extends StatelessWidget {
  PageController pageController;
  String image;
  String featureName;
  String featureDesc;
  Color colorFeatureText;
  Color buttonColor;
  String buttonText;
  Color buttonTextColor;
  Function() onTap;

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
    required this.onTap,
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

              const SizedBox(height: 10,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 42),
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

              const SizedBox(height: 48,),

              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(12)
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
                onTap: (){onTap;},
              ),

              const SizedBox(height: 44,)
            ],
          ),
        )
      ],
    );
  }
}