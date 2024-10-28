import 'package:flutter/cupertino.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/body/app_body_components/warning_status_components/warning_info.dart';
import 'package:warm_cloud/body/app_body_components/warning_status_components/warning_title.dart';

class WarningStatus extends StatelessWidget {
  final String? rain_percentage;
  final String? expected_time;
  final String? weather_emoji;
  final String? warning_title;

  const WarningStatus(
      {super.key,
      required this.rain_percentage,
      required this.expected_time,
      required this.warning_title,
      required this.weather_emoji});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.hintOfRed,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WarningInfo(
            expected_time: expected_time,
            rain_percentage: rain_percentage,
            weather_emoji: weather_emoji,
          ),
          //const SizedBox(height: 20,),
          WarningTitle(title: warning_title),
        ],
      ),
    );
  }
}
