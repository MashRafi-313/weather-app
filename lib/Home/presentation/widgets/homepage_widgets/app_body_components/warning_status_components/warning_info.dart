import 'package:flutter/material.dart';
import 'package:warm_cloud/Home/presentation/widgets/homepage_widgets/app_body_components/warning_status_components/warning_image.dart';
import 'package:warm_cloud/core/CustomWidgets/warning_hazard.dart';
import 'package:warm_cloud/core/styles/text_styles.dart';
import '../../../../../../core/app_color/app_color.dart';
import '../../../custom_widgets/title_subtitle.dart';

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
          weather_emoji: weatherEmoji,
        )
      ],
    );
  }
}
