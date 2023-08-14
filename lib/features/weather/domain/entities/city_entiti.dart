import 'package:new_weather_app/features/weather/domain/entities/coordinate_entiti.dart';

class CityEntiti {
  final int id;
  final String name;
  final CoordinateEntiti coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  CityEntiti({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });
}
