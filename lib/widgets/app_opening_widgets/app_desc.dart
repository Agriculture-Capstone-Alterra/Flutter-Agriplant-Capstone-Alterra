import 'package:flutter/material.dart';

class Desc1 extends StatelessWidget {
  PageController pageController;
  String image;

  Desc1({
    Key? key,
    required this.pageController,
    required this.image,
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