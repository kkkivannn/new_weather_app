import 'package:new_weather_app/features/weather/data/models/info_weather_model.dart';

abstract class RemoteDatasource {
  Future<InfoWeatherModel> getWeatherInfo(
      {required double lat, required double long});
}
