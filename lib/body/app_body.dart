import 'package:flutter/material.dart';
import 'package:warm_cloud/body/app_body_components/location_name.dart';
import 'package:warm_cloud/model/weather_data_info.dart';

import '../model/weather_data.dart';
import 'app_body_components/SearchBox.dart';
import 'app_body_components/SunStatus.dart';
import 'app_body_components/temperature.dart';
import 'app_body_components/warning_status.dart';
import 'app_body_components/weather_image.dart';
import 'app_body_components/weather_status.dart';

class AppBody extends StatefulWidget {
  final WeatherDataInfo? weatherDataInfo;
  final int? defaultIndex;

  const AppBody(
      {super.key, required this.weatherDataInfo, this.defaultIndex = 1});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  late int currentIndex;
  late WeatherData weatherData;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.defaultIndex!;
    weatherData = widget.weatherDataInfo!.weatherData![currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            SearchBox(),
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
            const SizedBox(
              height: 5,
            ),
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
              height: 5,
            ),
            // SunStatus(
            //   sunrise: weatherData.sunrise,
            //   sunset: weatherData.sunset,
            // ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
