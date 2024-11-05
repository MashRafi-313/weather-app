import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/model/weather_data_info.dart';
import 'package:provider/provider.dart';
import '../body/search_body.dart';
import '../provider/weather_data_info_provider.dart';

class SearchPage extends StatelessWidget{

   SearchPage({super.key});


  @override
  Widget build(BuildContext context) {
    final weatherDataInfoProvider = Provider.of<WeatherDataInfoProvider>(context);
    return Scaffold(
      body:SearchBody(weatherDataInfo : weatherDataInfoProvider.weatherDataInfo)
    );
  }

}