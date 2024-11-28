import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/Home/data/model/weather_info_model.dart';
import 'package:warm_cloud/Home/data/model/weather_model.dart';
import 'package:warm_cloud/Home/presentation/screens/home_screen.dart';
import 'package:warm_cloud/Home/presentation/widgets/search_screen/search_page/latest_searched_locations.dart';
import 'package:warm_cloud/Home/presentation/widgets/search_screen/search_page/suggested_list.dart';
import 'package:warm_cloud/core/app_color/app_color.dart';
import 'package:warm_cloud/core/custom_widgets/custom_card.dart';
import 'package:warm_cloud/core/styles/text_styles.dart';
import 'package:warm_cloud/core/utility/shared_preferences_key.dart';


class SearchPage extends StatefulWidget {
  final WeatherDataInfo? weatherDataInfo;

  const SearchPage({super.key, required this.weatherDataInfo});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          CustomCard(
            marginVertical: 2,
            paddingValue: 5,
            child: TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                  hintText: "Search Location",
                  hintStyle: TextStyles.regular15.copyWith(
                    color: AppColor.silver(Theme.of(context).brightness),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColor.porpoise(Theme.of(context).brightness),
                  ),
                  border: InputBorder.none),
            ),
          ),
          LatestSearchedLocations(latestLocations: latestLocations),
          Expanded(
            child: ListView.builder(
              itemCount: filteredWeatherData!.length,
              itemBuilder: (context, index) {
                final weather = filteredWeatherData![index];
                bool isWarning = weather.warnings != null;
                return GestureDetector(
                  onTap: () async {
                    int index = findIndex(weather.location);
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
                      await prefs.setInt(KeyType.currentIndex, index);
                      setState(() {
                        latestLocations = updateLocations;
                      });
                    }

                    _searchFocusNode.unfocus();
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
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
