import 'package:capstone_project/providers/app_opening_provider.dart';
import 'package:capstone_project/screens/app_opening_screens/splashscreen1.dart';
import 'package:capstone_project/screens/app_opening_screens/splashscreen2.dart';
import 'package:capstone_project/widgets/app_opening_widgets/app_desc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDescScreen extends StatefulWidget {
  const AppDescScreen({Key? key}) : super(key: key);

  @override
  State<AppDescScreen> createState() => _AppDescScreenState();
}

class _AppDescScreenState extends State<AppDescScreen> {
  @override
  void initState() {
    Provider.of<AppOpeningProvider>(context, listen: false)
        .splashScreenIsChanged();
    Provider.of<AppOpeningProvider>(context, listen: false).splashScreenDone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppOpeningProvider>(
      builder: (context, appOpeningProvider, child) {
        return appOpeningProvider.splashScreen == true && appOpeningProvider.splashScreenVal == 1?
        SplashScreen1() :
        appOpeningProvider.splashScreen == true && appOpeningProvider.splashScreenVal == 2?
        SplashScreen2() :
        Scaffold(
          body: PageView(
            controller: appOpeningProvider.pageController,
            children: [
              AppDesc(
                pageController: appOpeningProvider.pageController,
                image: appOpeningProvider.feature1Image,
                featureName: appOpeningProvider.feature1Name,
                featureDesc: appOpeningProvider.feature1Desc,
                colorFeatureText: appOpeningProvider.colorFeatureText,
                buttonColor: appOpeningProvider.buttonColor,
                buttonText: appOpeningProvider.buttonText1,
                buttonTextColor: appOpeningProvider.buttonTextColor,
                changeView: () => appOpeningProvider.nextPage(context),
                skipText: appOpeningProvider.skipText,
                skipTextColor: appOpeningProvider.skipTextColor,
                skipToPage: () => appOpeningProvider.skipToLoginScreen(context),
              ),

              AppDesc(
                pageController: appOpeningProvider.pageController,
                image: appOpeningProvider.feature2Image,
                featureName: appOpeningProvider.feature2name,
                featureDesc: appOpeningProvider.feature2Desc,
                colorFeatureText: appOpeningProvider.colorFeatureText,
                buttonColor: appOpeningProvider.buttonColor,
                buttonText: appOpeningProvider.buttonText1,
                buttonTextColor: appOpeningProvider.buttonTextColor,
                changeView: () => appOpeningProvider.nextPage(context),
                skipText: appOpeningProvider.skipText,
                skipTextColor: appOpeningProvider.skipTextColor,
                skipToPage: () => appOpeningProvider.skipToLoginScreen(context),
              ),

              AppDesc(
                pageController: appOpeningProvider.pageController,
                image: appOpeningProvider.feature3Image,
                featureName: appOpeningProvider.feature3name,
                featureDesc: appOpeningProvider.feature1Desc,
                colorFeatureText: appOpeningProvider.colorFeatureText,
                buttonColor: appOpeningProvider.buttonColor,
                buttonText: appOpeningProvider.buttonText2,
                buttonTextColor: appOpeningProvider.buttonTextColor,
                changeView: () => appOpeningProvider.nextPage(context),
                skipText: appOpeningProvider.skipText,
                skipTextColor: appOpeningProvider.skipTextColor,
                skipToPage: () => appOpeningProvider.skipToLoginScreen(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
