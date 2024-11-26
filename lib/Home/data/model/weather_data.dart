import 'package:warm_cloud/Home/data/model/warnings.dart';

class WeatherData {
  String? location;
  String? weatherEmoji;
  String? temperature;
  int? uvIndex;
  String? rainPercentage;
  String? airQuality;
  String? sunrise;
  String? sunset;
  String? dayLength;
  Warnings? warnings;

  WeatherData(
      {this.location,
      this.weatherEmoji,
      this.temperature,
      this.uvIndex,
      this.rainPercentage,
      this.airQuality,
      this.sunrise,
      this.sunset,
      this.dayLength,
      this.warnings});

  WeatherData.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    weatherEmoji = json['weather_emoji'];
    temperature = json['temperature'];
    uvIndex = json['uv_index'];
    rainPercentage = json['rain_percentage'];
    airQuality = json['air_quality'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    dayLength = json['day_length'];
    warnings =
        json['warnings'] != null ? Warnings.fromJson(json['warnings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location;
    data['weather_emoji'] = weatherEmoji;
    data['temperature'] = temperature;
    data['uv_index'] = uvIndex;
    data['rain_percentage'] = rainPercentage;
    data['air_quality'] = airQuality;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['day_length'] = dayLength;
    if (warnings != null) {
      data['warnings'] = warnings!.toJson();
    }
    return data;
  }
}
