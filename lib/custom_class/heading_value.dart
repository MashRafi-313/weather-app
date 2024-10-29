import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/body/app_body.dart';

class HeadingValue extends StatelessWidget {
  final String? heading;
  final String? value;

  const HeadingValue({super.key, required this.heading, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          heading!,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColor.silver(Theme.of(context).brightness),
          ),
        ),
        Text(
          value!,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColor.dustyGray(Theme.of(context).brightness),),
        ),
      ],
    );
  }
}
