import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationManager {
  Future<void> getAddress(
      Position position, Function(String) onAddressUpdated) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    Placemark placemark = placemarks.first;

    String address =
        '${placemark.subAdministrativeArea}, ${placemark.isoCountryCode}';
    onAddressUpdated(address);
  }

  Future<void> getCurrentPosition(
      BuildContext context,
      Function(Position) onPositionUpdated,
      Function(String) onAddressUpdated) async {
    final hasPermission = await _handleLocationPermission(context);

    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      onPositionUpdated(position);
      getAddress(position, onAddressUpdated);
    });
  }

  Future<bool> _handleLocationPermission(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);

    if (!serviceEnabled) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'GPS Tidak Aktif, Silahkan Aktifkan GPS Anda',
            ),
          ),
        );
      }
      return false;
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();
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
}
