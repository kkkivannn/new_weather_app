import 'package:new_weather_app/features/weather/domain/entities/city_entiti.dart';
import 'package:new_weather_app/features/weather/domain/entities/weather_element_entiti.dart';

class InfoWeatherEntiti {
  final String cod;
  final int message;
  final int cnt;
  final List<WeatherElementEntiti> list;
  final CityEntiti city;

  InfoWeatherEntiti({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });
}
