import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:warm_cloud/Home/data/model/weather_info_model.dart';
import 'package:warm_cloud/Home/data/repository/weather/weather_repository.dart';

part 'weather_data_state.dart';

class WeatherCubit extends Cubit<WeatherDataState> {
  WeatherCubit(this.weatherRepository) : super(WeatherDataInitial());
  final WeatherRepository weatherRepository;

  Future<void> onLoadWeatherData() async {
    emit(WeatherDataLoading());
    final Either<String, WeatherDataInfo> result =
        await weatherRepository.getWeatherDataInfo();

    result.fold(
      (failure) => emit(WeatherDataError(failure)),
      (success) => emit(WeatherDataLoaded(success)),
    );
  }
}
