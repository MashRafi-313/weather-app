import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warm_cloud/Home/presentation/widgets/home_screen/home_page/weather_app_content/sun_status/sun_status_widgets/day_light.dart';
import 'package:warm_cloud/Home/presentation/widgets/home_screen/home_page/weather_app_content/sun_status/sun_status_widgets/horizontal_divider.dart';
import 'package:warm_cloud/Home/presentation/widgets/home_screen/home_page/weather_app_content/sun_status/sun_status_widgets/sun_status_heading.dart';
import 'package:warm_cloud/Home/presentation/widgets/home_screen/home_page/weather_app_content/sun_status/sun_status_widgets/sunrise_sunset_divider.dart';
import 'package:warm_cloud/core/custom_widgets/custom_card.dart';

class SunStatus extends StatelessWidget {
  final String? sunrise;
  final String? sunset;

  const SunStatus({
    super.key,
    required this.sunrise,
    required this.sunset,
  });

  @override
  Widget build(BuildContext context) {
    Duration lengthOfDay = findTimeDifference(sunrise, sunset);
    int lengthOfDayInHours = lengthOfDay.inHours;
    int lengthOfDayInMinutes = lengthOfDay.inMinutes % 60;

    String? currentTime = DateFormat('HH:mm').format(
      DateTime.now(),
    );
    Duration remainingDayLight = findTimeDifference(currentTime, sunset);
    int remainingDayLightInHours = remainingDayLight.inHours;
    int remainingDayLightInMinutes = remainingDayLight.inMinutes;

    if (remainingDayLightInHours <= lengthOfDayInHours) {
      remainingDayLightInHours =
          remainingDayLight.inHours > 0 ? remainingDayLight.inHours : 0;
      remainingDayLightInMinutes = remainingDayLight.inMinutes > 0
          ? remainingDayLight.inMinutes % 60
          : 0;
    }

    return CustomCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SunStatusHeading(),
          const SizedBox(
            height: 40,
          ),
          SunriseSunsetDivider(sunrise: sunrise, sunset: sunset),
          const HorizontalDivider(),
          const SizedBox(
            height: 40,
          ),
          DayLight(
            text: "Length of day: ",
            hours: lengthOfDayInHours,
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

Duration findTimeDifference(String? timeA, String? timeB) {
  DateTime parsedTimeA = DateFormat.Hm().parse(
    timeA!.split(" ")[0],
  );
  DateTime parsedTimeB = DateFormat.Hm().parse(
    timeB!.split(" ")[0],
  );
  parsedTimeB = parsedTimeB.add(
    const Duration(hours: 12),
  );

  DateTime now = DateTime.now().toUtc();
  DateTime firstTime = DateTime(
    now.year,
    now.month,
    now.day,
    parsedTimeA.hour,
    parsedTimeA.minute,
  );
  DateTime secondTime = DateTime(
    now.year,
    now.month,
    now.day,
    parsedTimeB.hour,
    parsedTimeB.minute,
  );

  Duration timeDifference = secondTime.difference(firstTime);
  return timeDifference;
}
