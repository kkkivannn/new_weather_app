import 'package:new_weather_app/features/weather/domain/entities/weather_entiti.dart';

class WeatherModel extends WeatherEntiti {
  WeatherModel({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
