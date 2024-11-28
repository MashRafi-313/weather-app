import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warm_cloud/core/custom_widgets/custom_card.dart';
import 'package:warm_cloud/core/custom_widgets/title_subtitle.dart';

class WeatherStatus extends StatelessWidget {
  final int? uvIndex;
  final String? rainPercentage;
  final String? airQuality;

  WeatherStatus(
      {super.key,
      required this.uvIndex,
      required this.rainPercentage,
      required this.airQuality});

  String formattedTime = DateFormat('hh:mm a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TitleSubtitle(heading: "TIME", value: formattedTime),
          ),
          Expanded(
            child: TitleSubtitle(heading: "UV", value: uvIndex.toString()),
          ),
          Expanded(
            child: TitleSubtitle(heading: "%RAIN", value: rainPercentage),
          ),
          Expanded(
            child: TitleSubtitle(heading: "AQ", value: airQuality),
          ),
        ],
      ),
    );
  }
}
