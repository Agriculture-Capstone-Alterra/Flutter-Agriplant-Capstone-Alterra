import 'package:capstone_project/data/home_text_style.dart';
import 'package:capstone_project/models/informasi_cuaca/current_weather_model.dart';
import 'package:capstone_project/models/informasi_cuaca/geocode_location_model.dart';
import 'package:capstone_project/screens/navigation_bar.dart';
import 'package:capstone_project/services/informasi_cuaca/current_weather_api.dart';
import 'package:capstone_project/services/informasi_cuaca/geocode_location_api.dart';
import 'package:capstone_project/widgets/informasi_cuaca/card_cari_cuaca.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  String result = '';

  @override
  Widget build(BuildContext context) {
    String? kotaSearch;
    String timeNow = DateFormat('HH:mm').format(DateTime.now());
    List<String> imgBackground = [
      'assets/images/rain.jpg',
      'assets/images/sky.jpg',
    ];
    List<String> temp = [
      "${widget.currentTemperature} °C",
      '27 °C',
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
                      setState(() {
                        if (response.data != null && response.data.length > 1) {
                          kotaSearch =
                              "${response.data[1].name}, ${response.data[1].countryCode}";
                          print('keganti');
                          print(kotaSearch);
                          CardCariCuaca(
                            imgBackground: imgBackground[1],
                            kota: kotaSearch!,
                            temp: temp[1],
                            timeNow: timeNow,
                          );
                          print('ganti card');
                        }
                      });
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
                  if (kotaSearch != null)
                    CardCariCuaca(
                      imgBackground: imgBackground[1],
                      kota: kotaSearch!,
                      temp: temp[1],
                      timeNow: timeNow,
                    ),
                ],
              )),
        ],
      ),
    );
  }
}
