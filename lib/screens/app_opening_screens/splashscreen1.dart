import 'package:capstone_project/providers/app_opening_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppOpeningProvider>(
      builder: (context, appOpeningProvider, child){
        return Material(
          color: Colors.white,
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width/4.5,
              height: MediaQuery.of(context).size.width/4.5,
              child: Center(
                child: Image.asset(
                  appOpeningProvider.splashScreen1Image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}