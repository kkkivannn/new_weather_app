import 'package:geolocator/geolocator.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

import 'app_location.dart';

class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({
    required this.lat,
    required this.long,
  });
}

class MoscowLocation extends AppLatLong {
  const MoscowLocation({
    super.lat = 55.7522200,
    super.long = 37.6155600,
  });
}

class LocationService implements AppLocation {
  final defLocation = const MoscowLocation();

  @override
  Future<bool> checkPermission() async {
    return Geolocator.checkPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  @override
  Future<AppLatLong> getCurrentLocation() async {
    return Geolocator.getCurrentPosition().then((value) {
      return AppLatLong(lat: value.latitude, long: value.longitude);
    }).catchError(
      (_) => defLocation,
    );
  }

  @override
  Future<bool> requestPermission() async {
    return Geolocator.requestPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  @override
  Future<GeocodeResponse> getLocation(
      {required double lat, required double long}) async {
    final YandexGeocoder geocoder =
        YandexGeocoder(apiKey: '456558e8-7edd-4d13-bb2f-a5c41d6fd643');
    final GeocodeResponse geocodeFromPoint = await geocoder.getGeocode(
      GeocodeRequest(
        geocode: PointGeocode(latitude: lat, longitude: long),
        lang: Lang.ru,
      ),
    );
    return geocodeFromPoint;
  }
}
