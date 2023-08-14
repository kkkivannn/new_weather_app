import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather_app/core/geolocator/app_lat_long.dart';
import 'package:new_weather_app/features/weather/domain/entities/info_weather_entiti.dart';
import 'package:new_weather_app/features/weather/domain/usecases/get_info_weather.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetInfoWeather getInfoWeather;
  WeatherCubit({required this.getInfoWeather}) : super(WeatherInitialState());
  Future<void> getWeather() async {
    try {
      emit(WeatherLoadingState());
      if (!await LocationService().checkPermission()) {
        await LocationService().requestPermission();
        if (await LocationService().checkPermission()) {
          final location = await LocationService().getCurrentLocation();
          final locationFromPoint = await LocationService()
              .getLocation(lat: location.lat, long: location.long);
          final response = await getInfoWeather.call(
              GetInfoWeatherParams(lat: location.lat, long: location.long));
          response.fold(
            (error) => emit(WeatherErrorState(error: error.error)),
            (data) => emit(WeatherLoadedState(
                infoWeatherModel: data, geoPosition: locationFromPoint)),
          );
        }
      } else {
        final location = await LocationService().getCurrentLocation();
        final locationFromPoint = await LocationService()
              .getLocation(lat: location.lat, long: location.long);
        final response = await getInfoWeather
            .call(GetInfoWeatherParams(lat: location.lat, long: location.long));
        response.fold(
          (error) => emit(WeatherErrorState(error: error.error)),
          (data) => emit(WeatherLoadedState(infoWeatherModel: data, geoPosition: locationFromPoint)),
        );
      }
    } catch (e) {
      emit(WeatherErrorState(error: e.toString()));
    }
  }
}
