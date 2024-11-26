part of 'weather_data_bloc.dart';

sealed class WeatherDataEvent extends Equatable {}

final class LoadWeatherDataEvent extends WeatherDataEvent {
  @override
  List<Object?> get props => [];
}
