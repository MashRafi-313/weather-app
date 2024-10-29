import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/body/search_body_components/suggested_list.dart';
import 'package:warm_cloud/model/weather_data.dart';
import 'package:warm_cloud/model/weather_data_info.dart';

class SearchBody extends StatefulWidget {
  final WeatherDataInfo? weatherDataInfo;
  final void Function(int) updateIndex;
  const SearchBody({super.key, required this.weatherDataInfo, required this.updateIndex});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final TextEditingController _searchController = TextEditingController();
  WeatherDataInfo? weatherDataInfo ;
  List<WeatherData>? weatherData = [];
  List<WeatherData>? filteredWeatherData = [];

  @override
  void initState() {
    super.initState();
    weatherDataInfo = widget.weatherDataInfo;
    weatherData = weatherDataInfo!.weatherData;
    filteredWeatherData = weatherDataInfo!.weatherData;
    _searchController.addListener(() {
      filterSearchResults(_searchController.text);
    });
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredWeatherData = query.isEmpty
          ? weatherData
          : weatherData!
          .where((weather) =>
          weather.location!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
 int  findIndex(String? location) {
    late int index;
    for(int i = 0; i < weatherData!.length ; i++) {
      if(weatherData![i].location == location){
        index = i;
        break;
      }
    }
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.hintOfRed),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  hintText: "Search Location",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColor.silver),
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColor.porpoise,
                  ),
                  border: InputBorder.none),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredWeatherData!.length,
              itemBuilder: (context, index) {
                final weather = filteredWeatherData![index];
                bool isWarning = weather.warnings != null;
                return GestureDetector(
                  onTap: (){
                    int index = findIndex(weather.location);
                    widget.updateIndex(index);
                    Navigator.pop(context);

                  },
                  child: SuggestedList(
                      location: weather.location,
                      temperature: weather.temperature,
                      weatherEmoji: isWarning
                          ? weather.warnings!.weatherEmoji
                          : weather.weatherEmoji,
                      weatherTitle:
                          isWarning ? weather.warnings!.warningTitle : null),
                );
              },
            ),
          )
        ],
      ),
    );
  }


}
