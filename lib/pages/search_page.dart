import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/model/weather_data_info.dart';

import '../body/search_body.dart';

class SearchPage extends StatelessWidget{
  final void Function(int) updateIndex;
   SearchPage({super.key, required this.weatherDataInfo, required this.updateIndex});
  final WeatherDataInfo? weatherDataInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SearchBody(weatherDataInfo: weatherDataInfo, updateIndex: updateIndex)
    );
  }

}