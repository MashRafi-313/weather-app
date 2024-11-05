import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:provider/provider.dart';

import '../../provider/index_provider.dart';
import '../../provider/weather_data_info_provider.dart';
class Temperature extends StatelessWidget{
  const Temperature({super.key});

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    final weatherDataInfoProvider = Provider.of<WeatherDataInfoProvider>(context);
    String temperature = weatherDataInfoProvider
        .weatherDataInfo.weatherData![indexProvider.index].temperature!;
      return Text(
        temperature,
        style: TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.w500,
          color: AppColor.mineShaft(Theme.of(context).brightness)
        ),
      );
  }


}