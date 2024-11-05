import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/custom_class/heading_value.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/index_provider.dart';
import '../../provider/weather_data_info_provider.dart';

class WeatherStatus extends StatelessWidget {
   WeatherStatus({super.key});

  String formattedTime = DateFormat('hh:mm a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    final weatherDataInfoProvider =
        Provider.of<WeatherDataInfoProvider>(context);
    int uvIndex = weatherDataInfoProvider
        .weatherDataInfo.weatherData![indexProvider.index].uvIndex!;
    String rainPercentage = weatherDataInfoProvider
        .weatherDataInfo.weatherData![indexProvider.index].rainPercentage!;
    String airQuality = weatherDataInfoProvider
        .weatherDataInfo.weatherData![indexProvider.index].airQuality!;

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
            child: HeadingValue(heading: "UV", value: uvIndex.toString()),
          ),
          Expanded(
            child: HeadingValue(heading: "%RAIN", value: rainPercentage),
          ),
          Expanded(
            child: HeadingValue(heading: "AQ", value: airQuality),
          ),
        ],
      ),
    );
  }
}
