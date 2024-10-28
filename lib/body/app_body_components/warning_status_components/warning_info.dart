import 'package:flutter/cupertino.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/body/app_body_components/warning_status_components/warning_image.dart';

import '../../../custom_class/heading_value.dart';

class WarningInfo extends StatelessWidget {
  final String? weather_emoji;
  final String? rain_percentage;
  final String? expected_time;

  const WarningInfo(
      {super.key, required this.weather_emoji, required this.rain_percentage, required this.expected_time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //leftside
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(text: TextSpan(
                children: [
                  WidgetSpan(
                      child: Image.asset('assets/images/warningHazard.png')),
                  const TextSpan(text: " "),
                  TextSpan(text: "WARNING",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.gold
                      )
                  ),
                ]
            )),
            const SizedBox(height: 20,),
            Row(
              children: [
                HeadingValue(heading: "%RAIN", value: rain_percentage,),
                const SizedBox(width: 25,),
                HeadingValue(heading: "EXPECTED_TIME", value: expected_time!.split(' - ')[0],),
              ],
            )
          ],
        ),
        //rightside
        const SizedBox(width: 50,),
        WarningImage(weather_emoji: weather_emoji,)
      ],
    );
  }

}
