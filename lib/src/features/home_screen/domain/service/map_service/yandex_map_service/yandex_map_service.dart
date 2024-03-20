import 'package:geolocator/geolocator.dart';

abstract class AppLocation {
  Future<AppLatLong> getCurrentLocation();
  Future<bool> requestPeremesion();
  Future<bool> checkPeremesion();
}

class LocationService implements AppLocation {
  final defLocation = MoscowLocation();
  @override
  Future<AppLatLong> getCurrentLocation() async {
    return Geolocator.getCurrentPosition().then((value) {
      return AppLatLong(lat: value.latitude, long: value.longitude);
    }).catchError((_) => defLocation);
  }

  @override
  Future<bool> requestPeremesion() async {
    return Geolocator.requestPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  @override
  Future<bool> checkPeremesion() async {
    return Geolocator.checkPermission().then((value) =>
        value == LocationPermission.always ||
        value == LocationPermission.whileInUse).catchError((_) => false);
  }
}

class AppLatLong {
  final double lat;
  final double long;
  AppLatLong({required this.lat, required this.long});
  @override
  String toString() {
    return """
    lat:$lat,
    long:$long
""";
  }
}

class MoscowLocation extends AppLatLong {
  MoscowLocation({super.lat = 55.7522200, super.long = 37.6155600});
}
