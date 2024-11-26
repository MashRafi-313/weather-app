import 'package:flutter/material.dart';
import 'package:warm_cloud/core/styles/text_styles.dart';

import '../../../../../../../../core/app_color/app_color.dart';

class SunStatusHeading extends StatelessWidget {
  const SunStatusHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "SUNRISE & SUNSET",
      style: TextStyles.medium12.copyWith(
        color: AppColor.silver(Theme.of(context).brightness),
      ),
    );
  }
}
