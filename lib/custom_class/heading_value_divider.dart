import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/body/app_body_components/SunStatus/vertical_divider.dart';

class HeadingValueDivider extends StatelessWidget {
  final String? heading;
  final String? value;

  const HeadingValueDivider(
      {super.key, required this.heading, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          heading!,
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColor.silver(Theme.of(context).brightness)),
        ),
        Text(
          value!,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColor.dustyGray(Theme.of(context).brightness),
          ),
        ),
        SizedBox(height: 60, child: Verticaldivider()),
      ],
    );
  }
}
