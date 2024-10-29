import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/custom_class/heading_value.dart';
import 'package:intl/intl.dart';

class WeatherStatus extends StatelessWidget {
  final int? uv_index;
  final String? rain_percentage;
  final String? air_quality;

  WeatherStatus(
      {super.key,
      required this.uv_index,
      required this.rain_percentage,
      required this.air_quality});

  String formattedTime = DateFormat('hh:mm a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.hintOfRed(Theme.of(context).brightness),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: HeadingValue(heading: "TIME", value: formattedTime),
          ),
          Expanded(
            child: HeadingValue(heading: "UV", value: uv_index.toString()),
          ),

          Expanded(
            child: HeadingValue(heading: "%RAIN", value: rain_percentage),
          ),
          //
          Expanded(
            child: HeadingValue(heading: "AQ", value: air_quality),
          ),
        ],
      ),
    );
  }
}
