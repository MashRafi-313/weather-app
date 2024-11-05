import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:provider/provider.dart';

import '../../../provider/index_provider.dart';
import '../../../provider/weather_data_info_provider.dart';
class WarningTitle extends StatelessWidget {
   WarningTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    final weatherDataInfoProvider = Provider.of<WeatherDataInfoProvider>(context);
    String warningTitle = weatherDataInfoProvider
        .weatherDataInfo.weatherData![indexProvider.index].warnings!.warningTitle!;
    return Text(
      warningTitle,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColor.gold(Theme.of(context).brightness),
      ),
    );
  }

}