import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/body/app_body_components/warning_status_components/warning_image.dart';
import 'package:provider/provider.dart';
import '../../../custom_class/heading_value.dart';
import '../../../provider/index_provider.dart';
import '../../../provider/weather_data_info_provider.dart';

class WarningInfo extends StatelessWidget {
  const WarningInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    final weatherDataInfoProvider =
        Provider.of<WeatherDataInfoProvider>(context);

    String weatherEmoji = weatherDataInfoProvider.weatherDataInfo
        .weatherData![indexProvider.index].warnings!.weatherEmoji!;
    String rainPercentage = weatherDataInfoProvider.weatherDataInfo
        .weatherData![indexProvider.index].warnings!.rainPercentage!;
    String expectedTime = weatherDataInfoProvider.weatherDataInfo
        .weatherData![indexProvider.index].warnings!.expectedTime!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              WidgetSpan(child: Image.asset('assets/images/warningHazard.png')),
              const TextSpan(text: " "),
              TextSpan(
                  text: "WARNING",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.gold(Theme.of(context).brightness))),
            ])),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                HeadingValue(
                  heading: "%RAIN",
                  value: rainPercentage,
                ),
                const SizedBox(
                  width: 25,
                ),
                HeadingValue(
                  heading: "EXPECTED_TIME",
                  value: expectedTime.split(' - ')[0],
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          width: 50,
        ),
        WarningImage(
          weather_emoji: weatherEmoji,
        )
      ],
    );
  }
}
