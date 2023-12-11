import 'package:flutter/material.dart';

class AppDesc extends StatelessWidget {
  PageController pageController;
  String image;
  String featureName;
  String featureDesc;

  AppDesc({
    Key? key,
    required this.pageController,
    required this.image,
    required this.featureName,
    required this.featureDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(image, fit: BoxFit.cover),

      // child: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         onPressed: (){
      //           if(pageController.page!=2){
      //             pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
      //           }
      //         },
      //         child: Icon(Icons.chevron_right),
      //       ),
      //       Text('halaman 1'),
      //     ],
      //   ),
      // ),
    );
  }
}