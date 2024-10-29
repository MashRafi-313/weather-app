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
  final Function() toggleMode;

  const AppBody({
    super.key,
    required this.weatherDataInfo,
    this.defaultIndex = 1,
    required this.toggleMode,
  });

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

  void updateIndex(int index) {
    setState(() {
      currentIndex = index;
      weatherData = widget.weatherDataInfo!.weatherData![currentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =  Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Switch Mode"),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    widget.toggleMode(); // Call the toggle function
                  },
                ),
              ],
            ),
            SearchBox(
                weatherDataInfo: widget.weatherDataInfo,
                updateIndex: updateIndex),
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
  }
}
