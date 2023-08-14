import 'package:new_weather_app/features/weather/data/models/coordinate_model.dart';
import 'package:new_weather_app/features/weather/domain/entities/city_entiti.dart';

class CityModel extends CityEntiti {
  CityModel(
      {required super.id,
      required super.name,
      required super.coord,
      required super.country,
      required super.population,
      required super.timezone,
      required super.sunrise,
      required super.sunset});
  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        name: json["name"],
        coord: CoordinateModel.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord,
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}
