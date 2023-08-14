import 'package:new_weather_app/features/weather/domain/entities/wind_entiti.dart';

class WindModel extends WindEntiti {
  WindModel({
    required super.speed,
    required super.deg,
    required super.gust,
  });
  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
      );
  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
