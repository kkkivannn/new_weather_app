import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:new_weather_app/core/error/failure.dart';
import 'package:new_weather_app/core/usecase/usecase.dart';
import 'package:new_weather_app/features/weather/domain/entities/info_weather_entiti.dart';
import 'package:new_weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetInfoWeather extends UseCase<InfoWeatherEntiti, GetInfoWeatherParams> {
  final WeatherRepository weatherRepository;

  GetInfoWeather({required this.weatherRepository});
  @override
  Future<Either<Failure, InfoWeatherEntiti>> call(
      GetInfoWeatherParams params) async {
    return await weatherRepository.getInfoWeather(
        lat: params.lat, long: params.long);
  }
}

class GetInfoWeatherParams extends Equatable {
  final double lat;
  final double long;

  const GetInfoWeatherParams({required this.lat, required this.long});
  @override
  List<Object?> get props => [];
}
