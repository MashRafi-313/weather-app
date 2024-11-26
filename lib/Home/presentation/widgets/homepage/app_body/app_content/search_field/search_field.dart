import 'package:flutter/material.dart';
import 'package:warm_cloud/Home/presentation/screens/search_page.dart';
import 'package:warm_cloud/Home/presentation/widgets/homepage/app_body/app_content/search_field/search_field_widgets.dart';

import '../../../../../../data/model/weather_data_info.dart';

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
            builder: (context) => SearchPage(
              weatherDataInfo: weatherDataInfo,
            ),
          ),
        );
      },
      child: const SearchFieldWidgets(),
    );
  }
}
