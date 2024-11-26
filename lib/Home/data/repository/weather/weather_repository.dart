import '../../model/weather_data_info.dart';

abstract class WeatherRepository {
  Future<WeatherDataInfo> getWeatherDataInfo();
}
