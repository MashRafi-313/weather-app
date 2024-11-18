// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../../data/datamodels/weather_data.dart';
// import '../../../../data/datasource/local/shared_preferences_key.dart';
//
// class LocationList extends StatelessWidget{
//   final  List<WeatherData?> filteredWeatherData;
//   const LocationList({super.key , required this.filteredWeatherData});
//
//   @override
//   Widget build(BuildContext context) {
//       return ListView.builder(
//         itemCount: filteredWeatherData!.length,
//         itemBuilder: (context, index) {
//           final weather = filteredWeatherData![index];
//           bool isWarning = weather!.warnings  != null;
//           return GestureDetector(
//             onTap: () async {
//               int index = findIndex(weather.location);
//               SharedPreferences prefs =
//               await SharedPreferences.getInstance();
//               List<String> updateLocations =
//                   prefs.getStringList(KeyType.latestLocations) ?? [];
//               if (weather.location != null &&
//                   (updateLocations.isEmpty ||
//                       updateLocations.first != weather.location)) {
//                 updateLocations.insert(0, weather.location!);
//                 if (updateLocations.length > 3) {
//                   updateLocations = updateLocations.sublist(0, 3);
//                 }
//                 await prefs.setStringList(
//                     KeyType.latestLocations, updateLocations);
//                 await prefs.setInt(KeyType.currentIndex, index);
//                 setState(() {
//                   latestLocations = updateLocations;
//                 });
//               }
//
//               _searchFocusNode.unfocus();
//               Navigator.pop(context);
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const HomePage(),
//                   ));
//             },
//             child: SuggestedList(
//                 location: weather.location,
//                 temperature: weather.temperature,
//                 weatherEmoji: isWarning
//                     ? weather.warnings!.weatherEmoji
//                     : weather.weatherEmoji,
//                 warningTitle:
//                 isWarning ? weather.warnings!.warningTitle : null),
//           );
//         },
//       );
//   }
//
// }