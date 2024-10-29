import 'package:flutter/material.dart';

import '../../../app_color/app_color.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "SUNRISE & SUNSET",
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColor.silver(Theme.of(context).brightness),
      ),
    );
  }
}
