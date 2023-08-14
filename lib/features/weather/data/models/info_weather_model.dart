import 'package:new_weather_app/features/weather/data/models/city_model.dart';
import 'package:new_weather_app/features/weather/data/models/weather_element_model.dart';
import 'package:new_weather_app/features/weather/domain/entities/info_weather_entiti.dart';

class InfoWeatherModel extends InfoWeatherEntiti {
  InfoWeatherModel(
      {required super.cod,
      required super.message,
      required super.cnt,
      required super.list,
      required super.city});
  factory InfoWeatherModel.fromJson(Map<String, dynamic> json) =>
      InfoWeatherModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<WeatherElementModel>.from(
            json["list"].map((x) => WeatherElementModel.fromJson(x))),
        city: CityModel.fromJson(json["city"]),
      );
  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": list,
        "city": city,
      };
}
