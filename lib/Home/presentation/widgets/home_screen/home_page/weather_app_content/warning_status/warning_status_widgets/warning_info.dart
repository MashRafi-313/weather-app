import 'package:flutter/material.dart';
import 'package:warm_cloud/Home/presentation/widgets/home_screen/home_page/weather_app_content/warning_status/warning_status_widgets/warning_image.dart';
import 'package:warm_cloud/core/CustomWidgets/title_subtitle.dart';
import 'package:warm_cloud/core/CustomWidgets/warning_hazard.dart';

class WarningInfo extends StatelessWidget {
  final String? weatherEmoji;
  final String? rainPercentage;
  final String? expectedTime;

  const WarningInfo(
      {super.key,
      required this.weatherEmoji,
      required this.rainPercentage,
      required this.expectedTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WarningHazard(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TitleSubtitle(
                  heading: "%RAIN",
                  value: rainPercentage,
                ),
                const SizedBox(
                  width: 25,
                ),
                TitleSubtitle(
                  heading: "EXPECTED_TIME",
                  value: expectedTime!.split(' - ')[0],
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          width: 50,
        ),
        WarningImage(
          weatherEmoji: weatherEmoji,
        )
      ],
    );
  }
}
