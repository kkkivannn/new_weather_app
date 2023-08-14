import 'package:dartz/dartz.dart';
import 'package:new_weather_app/core/error/failure.dart';
import 'package:new_weather_app/core/network/network.dart';
import 'package:new_weather_app/features/weather/data/datasources/local_datasource/local_datasource.dart';
import 'package:new_weather_app/features/weather/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:new_weather_app/features/weather/data/models/info_weather_model.dart';
import 'package:new_weather_app/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDatasource remoteDatasource;
  final LocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatasource,
    required this.localDatasource,
  });
  @override
  Future<Either<Failure, InfoWeatherModel>> getInfoWeather(
      {required double lat, required double long}) async {
    try {
      if (await networkInfo.isConnected) {
        final data =
            await remoteDatasource.getWeatherInfo(lat: lat, long: long);
        localDatasource.saveWeather(infoWeatherModel: data);
        return Right(data);
      } else {
        final data = await localDatasource.getWeather();
        return Right(data);
      }
    } catch (error) {
      return Left(ServerFailure(error: error.toString()));
    }
  }
}
