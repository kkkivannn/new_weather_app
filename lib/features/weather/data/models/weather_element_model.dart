import 'package:new_weather_app/features/weather/data/models/clouds_model.dart';
import 'package:new_weather_app/features/weather/data/models/main_info_about_weather_model.dart';
import 'package:new_weather_app/features/weather/data/models/sys_model.dart';
import 'package:new_weather_app/features/weather/domain/entities/weather_element_entiti.dart';

import 'rain_model.dart';
import 'weather_model.dart';
import 'wind_model.dart';

class WeatherElementModel extends WeatherElementEntiti {
  WeatherElementModel(
      {required super.dt,
      required super.main,
      required super.weather,
      required super.clouds,
      required super.wind,
      required super.visibility,
      required super.pop,
      required super.sys,
      required super.dtTxt,
      required super.rain});
  factory WeatherElementModel.fromJson(Map<String, dynamic> json) =>
      WeatherElementModel(
        dt: DateTime.fromMillisecondsSinceEpoch(json["dt"]),
        main: MainInfoAboutWeatherModel.fromJson(json["main"]),
        weather: List<WeatherModel>.from(
            json["weather"].map((x) => WeatherModel.fromJson(x))),
        clouds: CloudsModel.fromJson(json["clouds"]),
        wind: WindModel.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"]?.toDouble(),
        sys: SysModel.fromJson(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
        rain: json['rain'] == null ? null : RainModel.fromJson(json["rain"]),
      );
  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main,
        "weather": weather,
        "clouds": clouds,
        "wind": wind,
        "visibility": visibility,
        "pop": pop,
        "sys": sys,
        "dt_txt": dtTxt.toIso8601String(),
        "rain": rain,
      };
}
