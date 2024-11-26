import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warm_cloud/Home/data/model/weather_data_info.dart';
import 'package:warm_cloud/Home/data/repository/weather/weather_repository_local.dart';

part 'weather_data_event.dart';
part 'weather_data_state.dart';

class WeatherBloc extends Bloc<WeatherDataEvent, WeatherDataState> {
  final WeatherRepositoryLocal weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherDataInitial()) {
    on<LoadWeatherDataEvent>(_onLoadWeatherData);
  }

  Future<void> _onLoadWeatherData(
      LoadWeatherDataEvent event, Emitter<WeatherDataState> emit) async {
    emit(WeatherDataLoading());
    try {
      final weatherDataInfo = await weatherRepository.getWeatherDataInfo();
      emit(WeatherDataLoaded(weatherDataInfo));
    } catch (e) {
      emit(WeatherDataError(e.toString()));
    }
  }
}
