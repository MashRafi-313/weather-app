import 'package:flutter/material.dart';

import '../../../../../../../../core/app_color/app_color.dart';
import 'sunrise_sunset_divider_widgets/title_subtitle_divider.dart';

class SunriseSunsetDivider extends StatelessWidget {
  final String? sunrise;
  final String? sunset;

  const SunriseSunsetDivider(
      {super.key, required this.sunrise, required this.sunset});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        TitleSubtitleDivider(
          heading: "Sunrise",
          value: sunrise,
        ),
        const Spacer(),
        TitleSubtitleDivider(
          heading: "Sunset",
          value: sunset,
        ),
        const SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 1, top: 75, left: 5, right: 5),
          child: Text(
            "Horizon",
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColor.silver(Theme.of(context).brightness)),
          ),
        )
      ],
    );
  }
}
