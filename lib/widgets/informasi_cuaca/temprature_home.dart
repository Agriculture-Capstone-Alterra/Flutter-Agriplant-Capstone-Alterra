// import 'package:capstone_project/data/home_text_style.dart';
// import 'package:flutter/material.dart';

// // List<String> time = [
// //   'Now',
// //   '04:00',
// //   '05:00',
// //   '06:00',
// //   '07:00',
// //   '08:00',
// //   '09:00',
// //   '10:00',
// //   '11:00',
// //   '12:00',
// // ];
// // List<String> temprature = [
// //   '27°',
// //   '26°',
// //   '26°',
// //   '25°',
// //   '22°',
// //   '25°',
// //   '25°',
// //   '27°',
// //   '27°',
// //   '28°',
// // ];

// class TempratureHome extends StatefulWidget {
//   final Color colorText;
//   final double leftPadding;
//   final List<double> hourlyTemp;
//   final List<String> hourlyTime;
//   TempratureHome({
//     super.key,
//     this.colorText = Colors.black,
//     this.leftPadding = 16,
//     required this.hourlyTemp,
//     required this.hourlyTime,
//   });

//   @override
//   State<TempratureHome> createState() => _TempratureHomeState();
// }

// class _TempratureHomeState extends State<TempratureHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: widget.leftPadding, right: 14),
//       child: SizedBox(
//         height: 86,
//         width: double.maxFinite,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: widget.hourlyTime.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Padding(
//               padding: const EdgeInsets.only(
//                 right: 20,
//               ),
//               child: Row(
//                 children: [
//                   Column(
//                     children: [
//                       BodySmall(
//                         text: widget.hourlyTime[index],
//                         color: widget.colorText,
//                       ),
//                       const SizedBox(
//                         height: 4,
//                       ),
//                       const Image(
//                         image: AssetImage(
//                           'assets/images/cloud.png',
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 4,
//                       ),
//                       BodySmall(
//                         text: "${widget.hourlyTemp[index]}",
//                         color: widget.colorText,
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:capstone_project/data/home_text_style.dart';
import 'package:flutter/material.dart';

List<String> time = [
  'Now',
  '04:00',
  '05:00',
  '06:00',
  '07:00',
  '08:00',
  '09:00',
  '10:00',
  '11:00',
  '12:00',
];
List<String> temprature = [
  '27°',
  '26°',
  '26°',
  '25°',
  '22°',
  '25°',
  '25°',
  '27°',
  '27°',
  '28°',
];

class TempratureHome extends StatelessWidget {
  final Color colorText;
  final double leftPadding;
  const TempratureHome({
    super.key,
    this.colorText = Colors.black,
    this.leftPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: 14),
      child: SizedBox(
        height: 86,
        width: double.maxFinite,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      BodySmall(
                        text: time[index],
                        color: colorText,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Image(
                        image: AssetImage('assets/images/cloud.png'),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      BodySmall(
                        text: temprature[index],
                        color: colorText,
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
