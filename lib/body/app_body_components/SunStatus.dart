import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/custom_class/heading_value_divider.dart';

import 'SunStatus/heading.dart';
import 'SunStatus/horizontal_divider.dart';

class SunStatus extends StatelessWidget {
  final String? sunrise;
  final String? sunset;
 late Duration lengthOfDay;
  // late final Duration lengthOfDay;
  SunStatus({super.key, required this.sunrise, required this.sunset}) {
    // DateTime sunSet = DateFormat.Hm().parse(sunset!);
    // DateTime sunRise = DateFormat.jm().parseStrict(sunrise!);
    //
    // DateTime today = DateTime.now().toUtc();
    // sunSet = DateTime(today.year, today.month, today.day, sunSet.hour, sunSet.minute);
    // sunRise = DateTime(today.year, today.month, today.day, sunRise.hour, sunRise.minute);
    //
    // // Calculate the length of day
    // lengthOfDay = sunSet.difference(sunRise);
  }

  @override
  Widget build(BuildContext context) {
    // int hours = lengthOfDay.inHours;
    // int minutes = lengthOfDay.inMinutes%60;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColor.hintOfRed),
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
                child: HeadingValueDivider(heading: "Sunrise", value: sunrise),
              ),
              const SizedBox(
                width: 60,
              ),
              Center(
                child: HeadingValueDivider(heading: "Sunset", value: sunset),
              ),
            ],
          ),
          const HorizontalDivider(),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Length of day:",
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColor.dustyGray),
          ),
          Text("Remaining DayLight:",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColor.dustyGray)),
        ],
      ),
    );
  }
}
