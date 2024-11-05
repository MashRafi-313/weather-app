import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';

class Temperature extends StatelessWidget {
  final String? temperature;

  const Temperature({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Text(
      temperature!,
      style: TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.w500,
          color: AppColor.mineShaft(Theme.of(context).brightness)),
    );
  }
}
