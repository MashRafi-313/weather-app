import 'package:flutter/cupertino.dart';
import 'package:warm_cloud/body/app_body_components/switch_mode.dart';
import 'package:warm_cloud/body/app_body_components/temperature.dart';
import 'package:warm_cloud/body/app_body_components/warning_status.dart';
import 'package:warm_cloud/body/app_body_components/weather_image.dart';
import 'package:warm_cloud/body/app_body_components/weather_status.dart';

import '../../model/weather_data.dart';
import '../../model/weather_data_info.dart';
import 'SearchBox.dart';
import 'SunStatus.dart';
import 'location_name.dart';

class AppContent extends StatelessWidget {
  final WeatherDataInfo? weatherDataInfo;

  final Function(int) updateIndex;
  final currentIndex;

  AppContent(
      {super.key,
      required this.updateIndex,
      this.currentIndex,
      this.weatherDataInfo});

  @override
  Widget build(BuildContext context) {
    late WeatherData weatherData;
    if (weatherDataInfo != null && weatherDataInfo!.weatherData != null) {
      weatherData = weatherDataInfo!.weatherData![currentIndex];
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SwitchMode(),
              SearchBox(
                weatherDataInfo: weatherDataInfo,
                updateIndex: updateIndex,
              ),
              const SizedBox(
                height: 5,
              ),
              WeatherImage(weatherImage: weatherData.weatherEmoji),
              const SizedBox(
                height: 5,
              ),
              LocationName(location: weatherData.location),
              const SizedBox(
                height: 5,
              ),
              Temperature(temperature: weatherData.temperature),
              if (weatherData.warnings != null)
                const SizedBox(
                  height: 5,
                ),
              if (weatherData.warnings != null)
                WarningStatus(
                  rain_percentage: weatherData.warnings!.rainPercentage,
                  expected_time: weatherData.warnings!.expectedTime,
                  warning_title: weatherData.warnings!.warningTitle,
                  weather_emoji: weatherData.warnings!.weatherEmoji,
                ),
              const SizedBox(
                height: 10,
              ),
              WeatherStatus(
                  uv_index: weatherData.uvIndex,
                  rain_percentage: weatherData.rainPercentage,
                  air_quality: weatherData.airQuality),
              const SizedBox(
                height: 10,
              ),
              SunStatus(
                sunrise: weatherData.sunrise,
                sunset: weatherData.sunset,
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      );
    } else {
      return const Center(
        child: Text("No WeatherDataInfo here"),
      );
    }
  }
}
