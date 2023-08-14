import 'package:yandex_geocoder/yandex_geocoder.dart';

import 'app_lat_long.dart';

abstract class AppLocation {
  Future<AppLatLong> getCurrentLocation();
  Future<bool> requestPermission();
  Future<bool> checkPermission();
  Future<GeocodeResponse> getLocation(
      {required double lat, required double long});
}
