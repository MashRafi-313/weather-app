import 'package:flutter/cupertino.dart';
import '../model/weather_data_info.dart';


class WeatherDataInfoProvider extends ChangeNotifier {

  late  WeatherDataInfo _weatherDataInfo ;

  WeatherDataInfo get weatherDataInfo => _weatherDataInfo;

  void updateWeatherDataInfo(WeatherDataInfo weatherDataInfo) {
    _weatherDataInfo = weatherDataInfo;
  }
}