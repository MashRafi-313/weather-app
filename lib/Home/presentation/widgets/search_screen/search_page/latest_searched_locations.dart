import 'package:flutter/material.dart';

import 'latest_searched.dart';

class LatestSearchedLocations extends StatelessWidget{
  List<String> latestLocations ;
  LatestSearchedLocations({super.key,required this.latestLocations});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: latestLocations.length,
        itemBuilder: (context, index) {
          return LatestSearched(location: latestLocations[index]);
        },
      ),
    );
  }

}