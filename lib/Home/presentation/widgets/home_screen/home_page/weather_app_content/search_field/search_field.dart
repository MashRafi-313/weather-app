import 'package:flutter/material.dart';
import 'package:warm_cloud/Home/data/model/weather_info_model.dart';
import 'package:warm_cloud/Home/presentation/screens/search_screen.dart';
import 'package:warm_cloud/Home/presentation/widgets/home_screen/home_page/weather_app_content/search_field/search_field_widgets.dart';

class SearchField extends StatelessWidget {
  final WeatherDataInfo? weatherDataInfo;

  const SearchField({super.key, required this.weatherDataInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchScreen(
              weatherDataInfo: weatherDataInfo,
            ),
          ),
        );
      },
      child: const SearchFieldWidgets(),
    );
  }
}
