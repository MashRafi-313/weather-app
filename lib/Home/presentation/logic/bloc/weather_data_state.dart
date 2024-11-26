part of 'weather_data_bloc.dart';

sealed class WeatherDataState extends Equatable {}

final class WeatherDataInitial extends WeatherDataState {
  @override
  List<Object?> get props => [];
}

final class WeatherDataLoaded extends WeatherDataState {
  final WeatherDataInfo weatherDataInfo;

  WeatherDataLoaded(this.weatherDataInfo);

  @override
  List<Object?> get props => [weatherDataInfo];
}

final class WeatherDataLoading extends WeatherDataState {
  @override
  List<Object?> get props => [];
}

final class WeatherDataError extends WeatherDataState {
  final String error;

  WeatherDataError(this.error);

  @override
  List<Object?> get props => [error];
}
