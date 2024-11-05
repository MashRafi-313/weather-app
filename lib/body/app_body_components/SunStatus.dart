import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/body/app_body_components/SunStatus/day_light.dart';
import 'package:warm_cloud/custom_class/heading_value_divider.dart';
import 'package:provider/provider.dart';
import '../../provider/index_provider.dart';
import '../../provider/weather_data_info_provider.dart';
import 'SunStatus/heading.dart';
import 'SunStatus/horizontal_divider.dart';

class SunStatus extends StatelessWidget {
  const SunStatus({
    super.key,
  });

  Duration _findTimeDifference(String? timeA, String? timeB) {
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

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    final weatherDataInfoProvider =
        Provider.of<WeatherDataInfoProvider>(context);
    String sunrise = weatherDataInfoProvider
        .weatherDataInfo.weatherData![indexProvider.index].sunrise!;
    String sunset = weatherDataInfoProvider
        .weatherDataInfo.weatherData![indexProvider.index].sunset!;


    Duration lengthOfDay = _findTimeDifference(sunrise, sunset);
    int lengthOfDayInHours = lengthOfDay.inHours;
    int lengthOfDayInMinutes = lengthOfDay.inMinutes % 60;

    String? currentTime = DateFormat('HH:mm').format(
      DateTime.now(),
    );
    Duration remainingDayLight = _findTimeDifference(currentTime, sunset);
    int remainingDayLightInHours = remainingDayLight.inHours;
    int remainingDayLightInMinutes = remainingDayLight.inMinutes;

    if (remainingDayLightInHours <= lengthOfDayInHours) {
      remainingDayLightInHours =
          remainingDayLight.inHours > 0 ? remainingDayLight.inHours : 0;
      remainingDayLightInMinutes = remainingDayLight.inMinutes > 0
          ? remainingDayLight.inMinutes % 60
          : 0;
    }

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              HeadingValueDivider(
                heading: "Sunrise",
                value: sunrise,
              ),
              const Spacer(),
              HeadingValueDivider(
                heading: "Sunset",
                value: sunset,
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 1, top: 75, left: 5, right: 5),
                child: Text(
                  "Horizon",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColor.silver(Theme.of(context).brightness)),
                ),
              )
            ],
          ),
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
