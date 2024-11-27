import 'package:flutter/material.dart';
import 'package:warm_cloud/Home/data/model/weather_info_model.dart';
import 'package:warm_cloud/Home/presentation/widgets/search_screen/search_page.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.weatherDataInfo});

  final WeatherDataInfo? weatherDataInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBody(
        weatherDataInfo: weatherDataInfo,
      ),
    );
  }
}
