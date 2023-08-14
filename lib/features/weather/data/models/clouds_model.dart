import 'package:new_weather_app/features/weather/domain/entities/clouds_entiti.dart';

class CloudsModel extends CloudsEntiti {
  CloudsModel({required super.all});
  factory CloudsModel.fromJson(Map<String, dynamic> json) => CloudsModel(
        all: json["all"],
      );
       Map<String, dynamic> toJson() => {
        "all": all,
    };
}
