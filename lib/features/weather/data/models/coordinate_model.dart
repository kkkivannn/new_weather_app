import 'package:new_weather_app/features/weather/domain/entities/coordinate_entiti.dart';

class CoordinateModel extends CoordinateEntiti {
  CoordinateModel({
    required super.lat,
    required super.lon,
  });
  factory CoordinateModel.fromJson(Map<String, dynamic> json) =>
      CoordinateModel(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );
      Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
    };
}
