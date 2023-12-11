import 'package:capstone_project/providers/app_opening_provider.dart';
import 'package:capstone_project/widgets/app_opening_widgets/app_desc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDescScreen extends StatefulWidget {
  const AppDescScreen({Key? key}) : super(key: key);

  @override
  State<AppDescScreen> createState() => _AppDescScreenState();
}

class _AppDescScreenState extends State<AppDescScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppOpeningProvider>(
      builder: (context, appOpeningProvider, child) {
        return Scaffold(
          body: PageView(
            controller: pageController,
            children: [
              AppDesc(
                pageController: pageController,
                image: appOpeningProvider.feature1Image,
                featureName: '',
                featureDesc: '',
              ),

              AppDesc(
                pageController: pageController,
                image: appOpeningProvider.feature2Image,
                featureName: '',
                featureDesc: '',
              ),

              AppDesc(
                pageController: pageController,
                image: appOpeningProvider.feature3Image,
                featureName: '',
                featureDesc: '',
              ),
            ],
          ),
        );
      },
    );
  }
}