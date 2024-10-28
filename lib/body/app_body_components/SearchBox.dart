import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_color/app_color.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //on tap go to new page
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.all(3),
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
