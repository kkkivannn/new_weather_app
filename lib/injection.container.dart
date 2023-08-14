import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:new_weather_app/core/constants/constants.dart';
import 'package:new_weather_app/core/network/network.dart';
import 'package:new_weather_app/features/authorization/firebase/authorization.dart';
import 'package:new_weather_app/features/authorization/presentation/authorization/controller/authorization_cubit.dart';
import 'package:new_weather_app/features/authorization/presentation/registration/controller/registration_cubit.dart';
import 'package:new_weather_app/features/weather/data/datasources/local_datasource/local_datasource.dart';
import 'package:new_weather_app/features/weather/data/datasources/local_datasource/local_datasource_impl.dart';
import 'package:new_weather_app/features/weather/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:new_weather_app/features/weather/data/datasources/remote_datasource/remote_datasource_impl.dart';
import 'package:new_weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:new_weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:new_weather_app/features/weather/domain/usecases/get_info_weather.dart';
import 'package:new_weather_app/features/weather/presentation/controller/weather_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  sl.registerFactory<Dio>(
    () {
      return Dio(
        BaseOptions(
          baseUrl: Constants.baseUrl,
          validateStatus: (status) => status! <= 400,
        ),
      )..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            error: true,
            compact: true,
            maxWidth: 90,
            responseHeader: false,
          ),
        );
    },
  );
  sl.registerFactory<WeatherCubit>(
    () => WeatherCubit(getInfoWeather: sl()),
  );
  sl.registerLazySingleton(() => AuthorizationFirebase());
  sl.registerFactory<AuthorizationCubit>(
    () => AuthorizationCubit(authorizationFirebase: sl()),
  );
  sl.registerFactory<RegistrationCubit>(
    () => RegistrationCubit(authorizationFirebase: sl()),
  );

  sl.registerLazySingleton(
    () => GetInfoWeather(weatherRepository: sl()),
  );
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDatasource: sl(),
      localDatasource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImpl());
  sl.registerLazySingleton<LocalDatasource>(
      () => LocalDatasourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());
}
