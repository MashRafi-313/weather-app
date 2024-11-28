import 'package:dartz/dartz.dart';
import 'package:warm_cloud/Home/data/model/weather_info_model.dart';

abstract class WeatherRepository {
  Future<Either<String, WeatherDataInfo>> getWeatherDataInfo();
}
