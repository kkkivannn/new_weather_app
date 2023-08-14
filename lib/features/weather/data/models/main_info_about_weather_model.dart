import 'package:new_weather_app/features/weather/domain/entities/main_info_about_weather_entiti.dart';

class MainInfoAboutWeatherModel extends MainInfoAboutWeatherEntiti {
  MainInfoAboutWeatherModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.seaLevel,
    required super.grndLevel,
    required super.humidity,
    required super.tempKf,
  });
  factory MainInfoAboutWeatherModel.fromJson(Map<String, dynamic> json) =>
      MainInfoAboutWeatherModel(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
      );
      Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
    };
}
