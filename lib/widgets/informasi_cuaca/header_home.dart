import 'package:capstone_project/data/home_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// List<String> imgBackground = [
//   'assets/images/rain.jpg',
//   'assets/images/sky.jpg',
// ];

// List<String> kota = [
//   'Jakarta, ID',
//   'Bogor, ID',
// ];

// List<String> keterangan = [
//   'Sedia payung sebelum hujan ya',
//   'Jangan lupa pakai sunscreen',
// ];

// List<String> label = [
//   'km/h',
//   '85%',
//   '25%',
//   '25%',
// ];

// List<String> imagesLabel = [
//   'assets/images/wind.png',
//   'assets/images/drop_water.png',
//   'assets/images/drop_water.png',
//   'assets/images/drop_water.png',
// ];

// ignore: must_be_immutable
class HeaderHome extends StatefulWidget {
  final double latitude;
  final double longitude;
  final double currentTemperature;
  final double currentWindSpeed;
  String? currentPlace;
  List<String> imgBackground = [];
  List<String> kota = [];
  List<String> keterangan = [];
  List<String> label = [];
  List<String> imagesLabel = [];
  List<String> temperatureLabel = [];

  HeaderHome({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.currentPlace,
    required this.currentWindSpeed,
    required this.currentTemperature,
  })  : kota = [
          '$currentPlace',
          "Bogor, ID",
        ],
        label = [
          '$currentWindSpeed Km/h',
          '85%',
          '25%',
          '25%',
        ],
        keterangan = [
          'Sedia payung sebelum hujan ya',
          'Jangan lupa pakai sunscreen'
        ],
        imgBackground = [
          'assets/images/rain.jpg',
          'assets/images/sky.jpg',
        ],
        imagesLabel = [
          'assets/images/wind.png',
          'assets/images/drop_water.png',
          'assets/images/drop_water.png',
          'assets/images/drop_water.png',
        ],
        temperatureLabel = [
          '$currentTemperature °C',
          '27°C',
        ];

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  String? currentTimeNow;
  // final CurrentWeatherAPI currentWeatherAPI = CurrentWeatherAPI();
  // double? windSpeed;
  // double? temperature2M;

  // Future<void> getCurrentWeatherAPI() async {
  //   print('masuk getcurrent');
  //   try {
  //     CurrentWeatherModel response = await currentWeatherAPI.getCurrentWeather(
  //       widget.latitude,
  //       widget.longitude,
  //     );
  //     windSpeed = response.data.current.windSpeed10M;
  //     temperature2M = response.data.current.temperature2M;
  //     if (mounted) {
  //       setState(() {
  //         widget.label[0] = '${windSpeed ?? '0'} Km/h';
  //         widget.temperature[0] = '${temperature2M ?? '0'} °C';
  //       });
  //     }
  //     // setState(() {
  //     //   widget.label[0] = '${windSpeed ?? '0'} Km/h';
  //     //   widget.temperature[0] = '${temperature2M ?? '0'} °C';
  //     // });

  //     print('dapat getcurrent');
  //   } catch (e) {
  //     rethrow;
  //   }
  //   print('dapat getcurrent');
  // }

  Future<void> initTime() async {
    print('masuk kok bang');
    await initializeDateFormatting('id_ID', null).then(
      (value) {
        print('sedang menjalankan bang');
        currentTimeNow = DateFormat('EEEE, d MMM yyyy', 'id_ID').format(
          DateTime.now(),
        );
        print('jadi bang');
      },
    );
  }

  @override
  void initState() {
    initTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String datetimeNow = currentTimeNow ?? '-';
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
                        image: AssetImage(widget.imgBackground[index]),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, top: 12, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BodyNormal(text: widget.kota[index]),
                                BodySmall(text: datetimeNow),
                              ],
                            ),
                            Row(
                              children: [
                                const Image(
                                  image: AssetImage('assets/images/cloud.png'),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                BodyNormal(text: widget.temperatureLabel[index])
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
                                        image: AssetImage(
                                            widget.imagesLabel[index]),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      BodySmall(text: widget.label[index])
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
                              text: widget.keterangan[index],
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
          },
        ),
      ),
    );
  }
}
