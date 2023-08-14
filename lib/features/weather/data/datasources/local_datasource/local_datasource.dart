import 'package:new_weather_app/features/weather/data/models/info_weather_model.dart';

abstract class LocalDatasource {
  Future<void> saveWeather({required InfoWeatherModel infoWeatherModel});
  Future<InfoWeatherModel> getWeather();
}
