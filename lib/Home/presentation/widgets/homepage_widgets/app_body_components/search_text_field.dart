import 'package:flutter/material.dart';
import 'package:warm_cloud/Home/presentation/screens/search_page.dart';
import 'package:warm_cloud/Home/presentation/widgets/homepage_widgets/app_body_components/search_field_contents.dart';
import '../../../../domain/model/weather_data_info.dart';

class SearchTextField extends StatelessWidget {
  final WeatherDataInfo? weatherDataInfo;

  SearchTextField({super.key, required this.weatherDataInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchPage(
              weatherDataInfo: weatherDataInfo,
            ),
          ),
        );
      },
      child: const SearchFieldContents(),
    );
  }
}
