import 'package:dartz/dartz.dart';
import 'package:new_weather_app/core/error/failure.dart';
import 'package:new_weather_app/features/weather/domain/entities/info_weather_entiti.dart';

abstract class WeatherRepository {
  Future<Either<Failure, InfoWeatherEntiti>> getInfoWeather(
      {required double lat, required double long});
}
