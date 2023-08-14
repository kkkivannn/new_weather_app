import 'package:new_weather_app/features/weather/domain/entities/rain_entiti.dart';

class RainModel extends RainEntiti {
  RainModel({required super.the3H});
  factory RainModel.fromJson(Map<String, dynamic> json) => RainModel(
        the3H: json["3h"]?.toDouble(),
      );
      Map<String, dynamic> toJson() => {
        "3h": the3H,
    };
}
