import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/body/app_body_components/SunStatus/day_light.dart';
import 'package:warm_cloud/custom_class/heading_value_divider.dart';

import 'SunStatus/heading.dart';
import 'SunStatus/horizontal_divider.dart';

class SunStatus extends StatelessWidget {
  final String? sunrise;
  final String? sunset;

  const SunStatus({
    super.key,
    required this.sunrise,
    required this.sunset,
  });

  Duration _findTimeDifference(String? sunriseTime, String? sunsetTime) {
    DateTime parsedSunrise = DateFormat.Hm().parse(
      sunriseTime!.split(" ")[0],
    );
    DateTime parsedSunset = DateFormat.Hm().parse(
      sunsetTime!.split(" ")[0],
    );
    parsedSunset = parsedSunset.add(
      const Duration(hours: 12),
    );

    DateTime now = DateTime.now().toUtc();
    DateTime sunRise = DateTime(
      now.year,
      now.month,
      now.day,
      parsedSunrise.hour,
      parsedSunrise.minute,
    );
    DateTime sunSet = DateTime(
      now.year,
      now.month,
      now.day,
      parsedSunset.hour,
      parsedSunset.minute,
    );

    Duration lengthOfDay = sunSet.difference(sunRise);
    return lengthOfDay;
  }

  Duration _findRemainingDayLight(String? presentTime, String? sunsetTime) {
    DateTime parsedCurrentTime = DateFormat.Hm().parse(
      presentTime!,
    );
    DateTime parsedSunset = DateFormat.Hm().parse(
      sunsetTime!.split(" ")[0],
    );
    parsedSunset = parsedSunset.add(
      const Duration(hours: 12),
    );

    DateTime now = DateTime.now().toUtc();
    DateTime current = DateTime(
      now.year,
      now.month,
      now.day,
      parsedCurrentTime.hour,
      parsedCurrentTime.minute,
    );
    DateTime sunSet = DateTime(
      now.year,
      now.month,
      now.day,
      parsedSunset.hour,
      parsedSunset.minute,
    );

    Duration remainingDayLight = sunSet.difference(current);
    return remainingDayLight;
  }

  @override
  Widget build(BuildContext context) {
    Duration lengthOfDay = _findTimeDifference(sunrise, sunset);
    int lengthOfDayInHour = lengthOfDay.inHours;
    int lengthOfDayInMinutes = lengthOfDay.inMinutes % 60;
    String? currentTime = DateFormat('HH:mm').format(
      DateTime.now(),
    );
    Duration remainingDayLight = _findRemainingDayLight(currentTime, sunset);
    int remainingDayLightInHours =
        remainingDayLight.inHours > 0 ? remainingDayLight.inHours : 0;
    int remainingDayLightInMinutes =
        remainingDayLight.inMinutes > 0 ? remainingDayLight.inMinutes % 60 : 0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.hintOfRed(Theme.of(context).brightness),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Heading(),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: HeadingValueDivider(
                  heading: "Sunrise",
                  value: sunrise,
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              Center(
                child: HeadingValueDivider(
                  heading: "Sunset",
                  value: sunset,
                ),
              ),
            ],
          ),
          const HorizontalDivider(),
          const SizedBox(
            height: 40,
          ),
          DayLight(
            text: "Length of day: ",
            hours: lengthOfDayInHour,
            minutes: lengthOfDayInMinutes,
          ),
          DayLight(
            text: "Remaining daylight: ",
            hours: remainingDayLightInHours,
            minutes: remainingDayLightInMinutes,
          ),
        ],
      ),
    );
  }
}
