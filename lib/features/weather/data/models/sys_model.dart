import 'package:new_weather_app/features/weather/domain/entities/sys_entiti.dart';

class SysModel extends SysEntiti {
  SysModel({required super.pod});
  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
        pod: json["pod"],
      );
      Map<String, dynamic> toJson() => {
        "pod": pod,
    };
}
