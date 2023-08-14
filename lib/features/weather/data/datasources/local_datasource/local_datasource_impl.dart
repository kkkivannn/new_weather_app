import 'dart:convert';

import 'package:new_weather_app/features/weather/data/datasources/local_datasource/local_datasource.dart';
import 'package:new_weather_app/features/weather/data/models/info_weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatasourceImpl implements LocalDatasource {
  final SharedPreferences sharedPreferences;

  LocalDatasourceImpl({required this.sharedPreferences});
  @override
  Future<InfoWeatherModel> getWeather() async {
    final weatherInfo = sharedPreferences.getString('INFO_WEATHER');
    if (weatherInfo != null) {
      return InfoWeatherModel.fromJson(jsonDecode(weatherInfo));
    } else {
      throw "Error";
    }
  }

  @override
  Future<void> saveWeather(
      {required InfoWeatherModel infoWeatherModel}) async {
    await sharedPreferences.setString(
        'INFO_WEATHER', jsonEncode(infoWeatherModel.toJson()));
  }
}
