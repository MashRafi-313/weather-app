import 'package:warm_cloud/model/weather_data.dart';

class WeatherDataInfo {
  List<WeatherData>? weatherData;

  WeatherDataInfo({this.weatherData});

  WeatherDataInfo.fromJson(Map<String, dynamic> json) {
    if (json['weatherData'] != null) {
      weatherData = <WeatherData>[];
      json['weatherData'].forEach((v) {
        weatherData!.add(WeatherData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (weatherData != null) {
      data['weatherData'] = weatherData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
