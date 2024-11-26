import 'package:flutter/cupertino.dart';

import '../../../../data/model/weather_data.dart';
import '../../../../data/model/weather_data_info.dart';
import 'app_content/location_name/location_name.dart';
import 'app_content/search_field/search_field.dart';
import 'app_content/sun_status/sun_status.dart';
import 'app_content/switch_mode/switch_mode.dart';
import 'app_content/temperature/temperature.dart';
import 'app_content/warning_status/warning_status.dart';
import 'app_content/weather_image/weather_image.dart';
import 'app_content/weather_status/weather_status.dart';

class AppContent extends StatefulWidget {
  final WeatherDataInfo? weatherDataInfo;
  final int currentIndex;

  const AppContent(
      {super.key, required this.currentIndex, this.weatherDataInfo});

  @override
  State<AppContent> createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  @override
  Widget build(BuildContext context) {
    late WeatherData weatherData;
    if (widget.weatherDataInfo != null && widget.weatherDataInfo!.weatherData != null) {
      weatherData = widget.weatherDataInfo!.weatherData![widget.currentIndex];
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SwitchMode(),
              SearchField(
                weatherDataInfo: widget.weatherDataInfo,
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
                  rainPercentage: weatherData.warnings!.rainPercentage,
                  expectedTime: weatherData.warnings!.expectedTime,
                  warningTitle: weatherData.warnings!.warningTitle,
                  weatherEmoji: weatherData.warnings!.weatherEmoji,
                ),
              const SizedBox(
                height: 10,
              ),
              WeatherStatus(
                  uvIndex: weatherData.uvIndex,
                  rainPercentage: weatherData.rainPercentage,
                  airQuality: weatherData.airQuality),
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
