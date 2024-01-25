import 'package:capstone_project/data/home_text_style.dart';
import 'package:capstone_project/models/informasi_cuaca/current_weather_model.dart';
import 'package:capstone_project/models/informasi_cuaca/hourly_forecast_model.dart';
import 'package:capstone_project/screens/implementasi_ai/chatbot/chat_bot.dart';
import 'package:capstone_project/screens/implementasi_ai/chatbot/first_screen_chat_bot.dart';
import 'package:capstone_project/services/informasi_cuaca/current_weather_api.dart';
import 'package:capstone_project/services/informasi_cuaca/hourly_forecast_api.dart';
import 'package:capstone_project/widgets/implementasi_ai/chat_bot/screen_chat_bot/message_bubble_chat_bot.dart';
import 'package:capstone_project/screens/informasi_cuaca/weather_detail.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../widgets/informasi_cuaca/header_home.dart';
import '../../widgets/informasi_cuaca/pengingat_home.dart';
import '../../widgets/informasi_cuaca/tanaman_home.dart';
import '../../widgets/informasi_cuaca/temprature_home.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CurrentWeatherAPI currentWeatherAPI = CurrentWeatherAPI();
  final HourlyForecastAPI hourlyForecastAPI = HourlyForecastAPI();
  double? currentWindSpeeds;
  double? currentTemperatures;
  Position? _currentPosition;
  String? _currentAddress;
  List<double>? hourlyTemp;
  List<String>? hourlyTime;
  bool isAvailabe = false;

  Future<void> _getAddress(Position position) async {
    await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    ).then((value) {
      if (!mounted) return;
      setState(() {
        Placemark placemark = value.first;
        _currentAddress =
            '${placemark.subAdministrativeArea}, ${placemark.isoCountryCode}';
      });
    });
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission(context);

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      if (!mounted) return;
      setState(() {
        _currentPosition = position;
      });
      _getAddress(position);
    });
  }

  Future<bool> _handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);

    locationPermission = await Geolocator.checkPermission();
    print(locationPermission);

    if (locationPermission == LocationPermission.denied) {
      // if (context.mounted) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       content: Text(
      //         'Anda belum mengaktifkan izin lokasi di aplikasi anda',
      //       ),
      //     ),
      //   );
      // }
      await Geolocator.requestPermission();
    }

    if (locationPermission == LocationPermission.deniedForever) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Anda perlu mengaktifkan izin lewat pengaturan hp anda',
            ),
          ),
        );
      }
    }

    return true;
  }

  Future<void> getCurrentWeatherAPI() async {
    print('masuk getcurrent');
    try {
      CurrentWeatherModel response = await currentWeatherAPI.getCurrentWeather(
        _currentPosition?.latitude ?? 0,
        _currentPosition?.longitude ?? 0,
      );
      if (mounted) {
        setState(
          () {
            currentWindSpeeds = response.data.current.windSpeed10M;
            currentTemperatures = response.data.current.temperature2M;
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

  // Future<void> getHourlyForecast() async {
  //   try {
  //     print('masuk tuh bang hourlynya');
  //     HourlyForecastModel response = await hourlyForecastAPI.getHourlyForecast(
  //       _currentPosition?.latitude ?? 0,
  //       _currentPosition?.longitude ?? 0,
  //     );
  //     print('hourlynya jalan bang');
  //     if (mounted) {
  //       hourlyTemp?.addAll(response.data.hourly.temperature2M);
  //       hourlyTime?.addAll(response.data.hourly.time);
  //       print('mounted kok bang');
  //     }
  //     print('udah kesimpan tuh bang di listnya');
  //     print(hourlyTemp);
  //     print(hourlyTime);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<void> getHourlyForecastAPI() async {
  //   try {
  //     if (_currentPosition != null) {
  //       HourlyForecastModel response =
  //           await hourlyForecastAPI.getHourlyForecast(
  //         _currentPosition?.latitude ?? 0,
  //         _currentPosition?.longitude ?? 0,
  //       );

  //       print('Hourly Forecast Data: ${response.data}');
  // if (!mounted) return;
  // setState(() {
  //   hourlyForecastDataList = response.data.hourly.time;
  //   hourlyForecastTemperature = response.data.hourly.temperature2M;
  // });
  //     }
  //   } catch (e) {
  //     print('Error in getHourlyForecastAPI: $e');
  //     // Handle the error or rethrow it based on your application's requirements
  //   }
  // }

  // Future<void> getHourlyForecastAPI() async {
  //   await hourlyForecastAPI.getHourlyForecast(
  //         _currentPosition?.latitude ?? 0,
  //         _currentPosition?.longitude ?? 0,
  //       )then((value) {
  //         if (!mounted) return;
  //       setState(() {
  //         hourlyForecastDataList = response.data.hourly.time;
  //         hourlyForecastTemperature = response.data.hourly.temperature2M;
  //       },);
  //       },);
  // }

  @override
  void initState() {
    _getCurrentPosition().then((value) {
      getCurrentWeatherAPI();
      hourlyTemp = [];
      // hourlyTime = [];
      // getHourlyForecast().then(
      //   (value) {
      //     isAvailabe = true;
      //   },
      // );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double latitudeValue = _currentPosition?.latitude ?? 0;
    double longitudeValue = _currentPosition?.longitude ?? 0;
    String currentPlace = _currentAddress ?? "-";
    double currentWindSpeed = currentWindSpeeds ?? 0;
    double currentTemperature = currentTemperatures ?? 0;
    List<double> hourlyTempList = hourlyTemp ?? [];
    List<String> hourlyTimeList = hourlyTime ?? [];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 12,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/spa.png'),
                        const SizedBox(
                          width: 2,
                        ),
                        BodyLarge(text: 'Agriplant'),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        if (messages.isEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FirstScreenChatBot(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatBot(),
                            ),
                          );
                        }
                      },
                      child: Image.asset(
                        'assets/images/implementasi_ai/chat_bot/button_chat_bot.png',
                        width: 138,
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              HeaderHome(
                latitude: latitudeValue,
                longitude: longitudeValue,
                currentPlace: currentPlace,
                currentWindSpeed: currentWindSpeed,
                currentTemperature: currentTemperature,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 352,
                height: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleMedium(text: 'Cuaca Hari Ini'),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherDetail(
                              latitude: latitudeValue,
                              longitude: longitudeValue,
                              currentPlace: currentPlace,
                              currentWindSpeed: currentWindSpeed,
                              currentTemperature: currentTemperature,
                              hourlyTemp: hourlyTempList,
                              hourlyTime: hourlyTimeList,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          TitleSmall(text: '7 Hari Selanjutnya'),
                          const Image(
                            image:
                                AssetImage('assets/images/navigate_next.png'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const TempratureHome(),
              // if (isAvailabe)
              //   TempratureHome(
              //     // hourlyTemp: hourlyTempList,
              //     // hourlyTime: hourlyTimeList,
              // ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: TitleMedium(text: 'Pengingat Merawat Tanaman'),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const PengingatHome(),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: TitleMedium(text: 'Tanaman Kamu'),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const TanamanHome(),
              const SizedBox(
                height: 12,
              ),
              // const Padding(
              //   padding: EdgeInsets.only(left: 16),
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: Column(
              //       // children: [
              //       //   SizedBox(
              //       //     child: TitleMedium(
              //       //       text: 'Informasi Hama & Cara Menanganinya',
              //       //     ),
              //       //   ),
              //       //   // Text('Latitude = $latitudeValue'),
              //       //   // Text('Longitude = $longitudeValue'),
              //       //   // // Text('Jam = $hourNow'),
              //       //   // Text('Address = $currentPlace'),
              //       // ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
