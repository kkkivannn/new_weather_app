import 'package:new_weather_app/features/weather/domain/entities/clouds_entiti.dart';
import 'package:new_weather_app/features/weather/domain/entities/main_info_about_weather_entiti.dart';
import 'package:new_weather_app/features/weather/domain/entities/rain_entiti.dart';
import 'package:new_weather_app/features/weather/domain/entities/wind_entiti.dart';

import 'sys_entiti.dart';
import 'weather_entiti.dart';

class WeatherElementEntiti {
  final DateTime dt;
  final MainInfoAboutWeatherEntiti main;
  final List<WeatherEntiti> weather;
  final CloudsEntiti clouds;
  final WindEntiti wind;
  final int visibility;
  final double pop;
  final SysEntiti sys;
  final DateTime dtTxt;
  final RainEntiti? rain;

  WeatherElementEntiti({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
    required this.rain,
  });
}
