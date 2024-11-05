import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/body/app_body.dart';
import 'package:warm_cloud/body/app_body_components/app_content.dart';
import 'package:warm_cloud/body/search_body_components/latest_searched.dart';
import 'package:warm_cloud/body/search_body_components/suggested_list.dart';
import 'package:warm_cloud/data_storage/shared_preferences_key.dart';
import 'package:warm_cloud/model/weather_data.dart';
import 'package:warm_cloud/model/weather_data_info.dart';
import 'package:warm_cloud/pages/home_page.dart';
import 'package:warm_cloud/provider/index_provider.dart';
import 'package:provider/provider.dart';

class SearchBody extends StatefulWidget {
  final  WeatherDataInfo weatherDataInfo;
  SearchBody({super.key, required this.weatherDataInfo});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  WeatherDataInfo? weatherDataInfo;
  List<String> latestLocations = [];
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
    _searchFocusNode.requestFocus();
    _loadLatestLocations();
  }

  void _loadLatestLocations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      latestLocations = prefs.getStringList(KeyType.latestLocations) ?? [];
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
    _searchFocusNode.dispose();
    super.dispose();
  }

  int findIndex(String? location) {
    for (int i = 0; i < weatherData!.length; i++) {
      if (weatherData![i].location == location) {
        return i;
      }
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
                left: 20.0, right: 20, top: 20, bottom: 2),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.hintOfRed(Theme.of(context).brightness)),
            child: TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                  hintText: "Search Location",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColor.silver(Theme.of(context).brightness),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColor.porpoise(Theme.of(context).brightness),
                  ),
                  border: InputBorder.none),
            ),
          ),
          Container(
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: latestLocations.length,
              itemBuilder: (context, index) {
                return LatestSearched(location: latestLocations[index]);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredWeatherData!.length,
              itemBuilder: (context, index) {
                final weather = filteredWeatherData![index];
                bool isWarning = weather.warnings != null;
                return GestureDetector(
                  onTap: () async {
                    int index = findIndex(weather.location);
                    indexProvider.updateIndex(index);
                    //widget.updateIndex(index);

                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    List<String> updateLocations =
                        prefs.getStringList(KeyType.latestLocations) ?? [];
                    if (weather.location != null &&
                        (updateLocations.isEmpty ||
                            updateLocations.first != weather.location)) {
                      updateLocations.insert(0, weather.location!);
                      if (updateLocations.length > 3) {
                        updateLocations = updateLocations.sublist(0, 3);
                      }
                      await prefs.setStringList(
                          KeyType.latestLocations, updateLocations);
                      setState(() {
                        latestLocations = updateLocations;
                      });
                    }

                    _searchFocusNode.unfocus();
                    Navigator.pop(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: SuggestedList(
                      location: weather.location,
                      temperature: weather.temperature,
                      weatherEmoji: isWarning
                          ? weather.warnings!.weatherEmoji
                          : weather.weatherEmoji,
                      warningTitle:
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
