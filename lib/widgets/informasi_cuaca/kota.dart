import 'package:capstone_project/models/informasi_cuaca/current_weather_model.dart';
import 'package:capstone_project/models/informasi_cuaca/geocode_location_model.dart';
import 'package:capstone_project/services/informasi_cuaca/current_weather_api.dart';
import 'package:capstone_project/services/informasi_cuaca/geocode_location_api.dart';
import 'package:capstone_project/widgets/informasi_cuaca/card_cari_cuaca.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// List<String> imgBackground = [
// 'assets/images/rain.jpg',
// 'assets/images/sky.jpg',
// ];

// List<String> kota = [
// 'Jakarta Selatan, ID',
// 'Bogor, ID',
// ];

class KotaCuaca extends StatefulWidget {
  final String currentPlace;
  final double currentTemperature;
  const KotaCuaca({
    Key? key,
    required this.currentPlace,
    required this.currentTemperature,
  }) : super(key: key);

  @override
  State<KotaCuaca> createState() => _KotaCuacaState();
}

class _KotaCuacaState extends State<KotaCuaca> {
  final GeocodeLocationAPI geocodeLocationAPI = GeocodeLocationAPI();
  CurrentWeatherAPI currentWeatherAPI = CurrentWeatherAPI();
  String kotaSearch = '';
  double? latSearch;
  double? longSearch;
  double? windSearch;
  double? tempSearch;
  String result = '';
  bool isSearch = false;

  Future<void> getCurrentWeatherAPI(double lat, double long) async {
    print('masuk getcurrent');
    try {
      CurrentWeatherModel response = await currentWeatherAPI.getCurrentWeather(
        lat,
        long,
      );
      if (mounted) {
        setState(
          () {
            windSearch = response.data.current.windSpeed10M;
            tempSearch = response.data.current.temperature2M;
          },
        );
      }
      // setState(() {
      //   widget.label[0] = '${windSpeed ?? '0'} Km/h';
      //   widget.temperature[0] = '${temperature2M ?? '0'} °C';
      // });

      print('dapat getcurrent');
    } catch (e) {
      rethrow;
    }
    print('dapat getcurrent');
  }

  @override
  Widget build(BuildContext context) {
    String timeNow = DateFormat('HH:mm').format(DateTime.now());
    List<String> imgBackground = [
      'assets/images/rain.jpg',
      'assets/images/sky.jpg',
    ];
    List<String> temp = [
      "${widget.currentTemperature} °C",
    ];
    return SafeArea(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                height: 50.0,
                margin: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 12,
                ),
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 12,
                  bottom: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF2B2930),
                  borderRadius: BorderRadius.circular(55.0),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(
                      () {
                        result = value;
                      },
                    );
                  },
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.justify,
                  decoration: const InputDecoration(
                    labelText: 'Kota',
                    labelStyle: TextStyle(
                      color: Color(0xFF938F96),
                    ),
                    border: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              if (result.isNotEmpty)
                InkWell(
                  onTap: () async {
                    try {
                      print('test geocode');
                      GeocodeLocationModel response =
                          await geocodeLocationAPI.getGeocodeLocation(result);
                      print('Response: $response'); // Tambahkan log ini
                      setState(
                        () {
                          kotaSearch =
                              "${response.data[1].name}, ${response.data[1].countryCode}";
                          latSearch = response.data[1].latitude;
                          longSearch = response.data[1].longitude;
                          getCurrentWeatherAPI(
                              latSearch ?? 0.0, longSearch ?? 0.0);
                          print('keganti');
                          print(kotaSearch);
                          print('ganti card');
                          isSearch = true;
                        },
                      );
                    } catch (e) {
                      rethrow;
                    }
                  },
                  child: Container(
                    height: 50.0,
                    width: 365,
                    margin: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 12,
                    ),
                    child: Text(
                      result,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
              height: 242,
              width: 360,
              child: Column(
                children: [
                  CardCariCuaca(
                    imgBackground: imgBackground[0],
                    kota: widget.currentPlace,
                    temp: temp[0],
                    timeNow: timeNow,
                  ),
                  if (isSearch)
                    CardCariCuaca(
                      imgBackground: imgBackground[1],
                      kota: kotaSearch,
                      temp: '$tempSearch °C',
                      timeNow: timeNow,
                    ),
                ],
              )),
        ],
      ),
    );
  }
}