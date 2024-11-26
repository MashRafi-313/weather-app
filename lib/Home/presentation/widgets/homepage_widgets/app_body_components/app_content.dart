import 'package:flutter/cupertino.dart';
import 'package:warm_cloud/Home/presentation/widgets/homepage_widgets/app_body_components/switch_mode.dart';
import 'package:warm_cloud/Home/presentation/widgets/homepage_widgets/app_body_components/temperature.dart';
import 'package:warm_cloud/Home/presentation/widgets/homepage_widgets/app_body_components/warning_status.dart';
import 'package:warm_cloud/Home/presentation/widgets/homepage_widgets/app_body_components/weather_image.dart';
import 'package:warm_cloud/Home/presentation/widgets/homepage_widgets/app_body_components/weather_status.dart';
import '../../../../domain/model/weather_data.dart';
import '../../../../domain/model/weather_data_info.dart';
import 'search_text_field.dart';
import 'SunStatus.dart';
import 'location_name.dart';

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
              SearchTextField(
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
