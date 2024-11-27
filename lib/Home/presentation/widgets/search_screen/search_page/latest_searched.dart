import 'package:flutter/material.dart';
import 'package:warm_cloud/core/app_color/app_color.dart';

class LatestSearched extends StatelessWidget{
  final String location;
  const LatestSearched({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 60,
      margin: const EdgeInsets.only(right:10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.hintOfRed(Theme.of(context).brightness,),
      ),
      child: Center(
        child: Text(location,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColor.mineShaft(Theme.of(context).brightness),
        ),
        ),
      ),
    );
  }

}