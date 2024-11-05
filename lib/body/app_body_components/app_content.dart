import 'package:flutter/cupertino.dart';
import 'package:warm_cloud/body/app_body_components/switch_mode.dart';
import 'package:warm_cloud/body/app_body_components/temperature.dart';
import 'package:warm_cloud/body/app_body_components/warning_status.dart';
import 'package:warm_cloud/body/app_body_components/weather_image.dart';
import 'package:warm_cloud/body/app_body_components/weather_status.dart';
import 'package:provider/provider.dart';
import 'package:warm_cloud/model/warnings.dart';
import '../../model/weather_data_info.dart';
import '../../provider/index_provider.dart';
import '../../provider/weather_data_info_provider.dart';
import 'SearchBox.dart';
import 'SunStatus.dart';
import 'location_name.dart';

class AppContent extends StatelessWidget {
  final WeatherDataInfo weatherDataInfo;
  AppContent({
    super.key, required this.weatherDataInfo,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherDataInfoProvider>(context, listen: false)
          .updateWeatherDataInfo(weatherDataInfo);
    });
    final indexProvider = Provider.of<IndexProvider>(context);
    final weatherDataInfoProvider = Provider.of<WeatherDataInfoProvider>(context);
    Warnings? warnings = weatherDataInfoProvider
        .weatherDataInfo.weatherData![indexProvider.index].warnings;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SwitchMode(),
            SearchBox(),
            const SizedBox(
              height: 5,
            ),
            const WeatherImage(),
            const SizedBox(
              height: 5,
            ),
            const LocationName(),
            const SizedBox(
              height: 5,
            ),
            const Temperature(),
            if (warnings != null)
              const SizedBox(
                height: 5,
              ),
            if (warnings != null) const WarningStatus(),
            const SizedBox(
              height: 10,
            ),
            WeatherStatus(),
            const SizedBox(
              height: 10,
            ),
            const SunStatus(),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
    // } else {
    //   return const Center(
    //     child: Text("No WeatherDataInfo here"),
    //   );
    // }
  }
}
