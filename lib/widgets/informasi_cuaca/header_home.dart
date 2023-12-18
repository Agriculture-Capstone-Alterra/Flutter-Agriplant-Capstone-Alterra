import 'package:capstone_project/data/home_text_style.dart';
import 'package:flutter/material.dart';

List<String> imgBackground = [
  'assets/images/rain.jpg',
  'assets/images/sky.jpg'
];

List<String> kota = ['', 'Bogor, ID'];
List<String> keterangan = [
  'Sedia payung sebelum hujan ya',
  'Jangan lupa pakai sunscreen'
];

List<String> label = ['km/h', '85%', '25%', '25%'];
List<String> imagesLabel = [
  'assets/images/wind.png',
  'assets/images/drop_water.png',
  'assets/images/drop_water.png',
  'assets/images/drop_water.png'
];

class HeaderHome extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String currentPlace;

  const HeaderHome({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.currentPlace,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 10, right: 14),
      child: SizedBox(
        height: 192,
        width: double.maxFinite,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 6),
                child: SizedBox(
                  height: 192,
                  width: 344,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imgBackground[index]),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 12, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BodyNormal(text: currentPlace),
                                  BodySmall(text: 'Senin, 27 Sep 2023')
                                ],
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image:
                                        AssetImage('assets/images/cloud.png'),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  BodyNormal(text: '27°C')
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 310,
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 54),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image(
                                          image: AssetImage(imagesLabel[index]),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        BodySmall(text: label[index])
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: 310,
                          height: 28,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Center(
                              child: BodySmall(
                                text: keterangan[index],
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              // child: Padding(
              //   padding: const EdgeInsets.only(left: 6),
              //   child: SizedBox(
              //     height: 192,
              //     width: 344,
              //     child: DecoratedBox(
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //             image: AssetImage(imgBackground[0]), fit: BoxFit.cover),
              //         borderRadius: BorderRadius.circular(16),
              //       ),
              //       child: Column(
              //         children: [
              //           Padding(
              //             padding:
              //                 const EdgeInsets.only(left: 16, top: 12, right: 16),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     BodyNormal(text: currentPlace),
              //                     BodySmall(text: 'Senin, 27 Sep 2023')
              //                   ],
              //                 ),
              //                 Row(
              //                   children: [
              //                     const Image(
              //                       image: AssetImage('assets/images/cloud.png'),
              //                     ),
              //                     const SizedBox(
              //                       width: 8,
              //                     ),
              //                     BodyNormal(text: '27°C')
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //           const SizedBox(
              //             height: 20,
              //           ),
              //           SizedBox(
              //             width: 310,
              //             height: 60,
              // child: ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: 4,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Padding(
              //       padding: const EdgeInsets.only(right: 54),
              //       child: Row(
              //         children: [
              //           Column(
              //             children: [
              //               Image(
              //                 image: AssetImage(imagesLabel[index]),
              //               ),
              //               const SizedBox(
              //                 height: 4,
              //               ),
              //               BodySmall(text: label[index])
              //             ],
              //           )
              //         ],
              //       ),
              //     );
              //               },
              //             ),
              //             // child: Padding(
              //             //   padding: const EdgeInsets.only(right: 54),
              //             //   child: Row(
              //             //     children: [
              //             //       Column(
              //             //         children: [
              //             //           Image(
              //             //             image: AssetImage(imagesLabel[0]),
              //             //           ),
              //             //           const SizedBox(
              //             //             height: 4,
              //             //           ),
              //             //           BodySmall(text: label[0])
              //             //         ],
              //             //       )
              //             //     ],
              //             //   ),
              //             // ),
              //           ),
              //           const SizedBox(
              //             height: 12,
              //           ),
              //           SizedBox(
              //             width: 310,
              //             height: 28,
              //             child: DecoratedBox(
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(12),
              //                   color: Colors.white),
              //               child: Center(
              //                 child: BodySmall(
              //                   text: 'tes',
              //                   color: Colors.black,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            }),
      ),
    );
  }
}