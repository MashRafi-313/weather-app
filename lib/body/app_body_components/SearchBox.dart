import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/body/search_body.dart';
import 'package:warm_cloud/model/weather_data_info.dart';
import 'package:warm_cloud/pages/search_page.dart';

import '../../app_color/app_color.dart';

class SearchBox extends StatelessWidget {
  final WeatherDataInfo? weatherDataInfo;
  final void Function(int) updateIndex;
   SearchBox({super.key,required this.weatherDataInfo, required this.updateIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //on tap go to new page
      onTap:() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(weatherDataInfo: weatherDataInfo,
            updateIndex : updateIndex
        ),),);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColor.hintOfRed),
        child: ListTile(
          title: Text(
            "Search Location",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColor.silver),
          ),
          trailing: Icon(
            Icons.search,
            color: AppColor.silver,
          ),
        ),
      ),
    );
  }
}
