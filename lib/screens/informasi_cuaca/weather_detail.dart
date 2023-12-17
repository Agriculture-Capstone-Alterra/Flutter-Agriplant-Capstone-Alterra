import 'package:capstone_project/data/home_text_style.dart';
import 'package:capstone_project/screens/implementasi_ai/chatbot/first_screen_chat_bot.dart';
import 'package:capstone_project/screens/informasi_cuaca/detail_cuaca.dart';
import 'package:capstone_project/widgets/informasi_cuaca/lokasi_detail_cuaca.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../widgets/informasi_cuaca/header_home.dart';
import '../../widgets/informasi_cuaca/pengingat_home.dart';
import '../../widgets/informasi_cuaca/tanaman_home.dart';
import '../../widgets/informasi_cuaca/temprature_home.dart';

class WeatherDetail extends StatefulWidget {
  const WeatherDetail({
    super.key,
  });

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  Position? _currentPosition;
  String? _currentAddress;

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
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Anda belum mengaktifkan izin lokasi di aplikasi anda',
            ),
          ),
        );
      }
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

  @override
  void initState() {
    _getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double latitudeValue = _currentPosition?.latitude ?? 0.0;
    double longitudeValue = _currentPosition?.longitude ?? 0.0;
    // String hourNow = DateFormat('HH:mm a').format(DateTime.now());
    String currentPlace = _currentAddress ?? "-";

    return Scaffold(
      body: SafeArea(

        child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/rain.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              
              LokasiDetailCuaca(
                latitude: latitudeValue,
                longitude: longitudeValue,
                currentPlace: currentPlace,
              ),
             
              
              
             
            ],
          ),
        ),
      ),
        )
        )
    );
  }
}
