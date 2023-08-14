part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final InfoWeatherEntiti infoWeatherModel;
  final GeocodeResponse geoPosition;

  const WeatherLoadedState(
      {required this.geoPosition, required this.infoWeatherModel});
  @override
  List<Object> get props => [];
}

class WeatherErrorState extends WeatherState {
  final String error;

  const WeatherErrorState({required this.error});
}
