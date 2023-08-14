import 'package:dio/dio.dart';
import 'package:new_weather_app/core/constants/constants.dart';
import 'package:new_weather_app/core/constants/endpoints.dart';
import 'package:new_weather_app/features/weather/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:new_weather_app/features/weather/data/models/info_weather_model.dart';
import 'package:new_weather_app/injection.container.dart';

class RemoteDatasourceImpl implements RemoteDatasource {
  final _dio = sl<Dio>();
  @override
  Future<InfoWeatherModel> getWeatherInfo(
      {required double lat, required double long}) async {
    try {
      final Response response = await _dio.get(
        Endpoints.getWeatherInfo.endpoint,
        queryParameters: {
          'lat': lat,
          'lon': long,
          'appid': Constants.apiKey,
          'units': "metric",
          'lang': "ru",
        },
      );
      return InfoWeatherModel.fromJson(response.data);
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }
}
