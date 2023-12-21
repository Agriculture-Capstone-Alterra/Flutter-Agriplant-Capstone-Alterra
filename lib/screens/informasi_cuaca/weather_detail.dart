import 'package:capstone_project/widgets/informasi_cuaca/glassmorph_list_hari_detail_cuaca.dart';
import 'package:capstone_project/widgets/informasi_cuaca/glassmorph_temprature_detail_cuaca.dart';
import 'package:capstone_project/widgets/informasi_cuaca/header_detail_cuaca.dart';
import 'package:capstone_project/widgets/informasi_cuaca/lokasi_detail_cuaca.dart';
import 'package:flutter/material.dart';

class WeatherDetail extends StatefulWidget {
  final double currentTemperature;
  final double currentWindSpeed;
  final double latitude;
  final double longitude;
  final String currentPlace;
  final List<double> hourlyTemp;
  final List<String> hourlyTime;
  const WeatherDetail({
    super.key,
    required this.currentTemperature,
    required this.currentWindSpeed,
    required this.latitude,
    required this.longitude,
    required this.currentPlace,
    required this.hourlyTemp,
    required this.hourlyTime,
  });

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  @override
  Widget build(BuildContext context) {
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
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 2,
                        right: 16,
                      ),
                      child: Column(
                        children: [
                          HeaderDetailCuaca(
                            currentPlace: widget.currentPlace,
                            currentTemperature: widget.currentTemperature,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          LokasiDetailCuaca(
                            latitude: widget.latitude,
                            longitude: widget.longitude,
                            currentPlace: widget.currentPlace,
                            currentTemperature: widget.currentTemperature,
                            currentWindSpeed: widget.currentWindSpeed,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TempratureDetailCuaca(
                            hourlyTemp: widget.hourlyTemp,
                            hourlyTime: widget.hourlyTime,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const ListHariDetailCuaca(),
                          const SizedBox(
                            height: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
