import 'package:flutter/material.dart';

import '../../../../../../../../core/app_color/app_color.dart';

class DayLight extends StatelessWidget {
  final String? text;
  final int? hours;
  final int? minutes;

  const DayLight({
    super.key,
    required this.text,
    required this.hours,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColor.dustyGray(Theme.of(context).brightness),
            ),
          ),
          TextSpan(
            text: "${hours}H ${minutes}M",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColor.mineShaft(Theme.of(context).brightness),
            ),
          )
        ],
      ),
    );
  }
}
