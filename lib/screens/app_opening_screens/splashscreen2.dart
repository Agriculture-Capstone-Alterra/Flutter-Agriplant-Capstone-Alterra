import 'package:capstone_project/providers/app_opening_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppOpeningProvider>(
      builder: (context, appOpeningProvider, child){
        return  Material(
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/3.7,
                child: Image.asset(
                  appOpeningProvider.splashScreen2Image1,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2.05,
                    height: MediaQuery.of(context).size.height/3,
                    child: Image.asset(
                      appOpeningProvider.splashScreen2Image2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2.05,
                    height: MediaQuery.of(context).size.height/3,
                    child: Image.asset(
                      appOpeningProvider.splashScreen2Image3,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}