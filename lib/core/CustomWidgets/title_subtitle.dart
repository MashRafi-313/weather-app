import 'package:flutter/material.dart';
import 'package:warm_cloud/core/styles/text_styles.dart';

import '../app_color/app_color.dart';

class TitleSubtitle extends StatelessWidget {
  final String? heading;
  final String? value;

  const TitleSubtitle({super.key, required this.heading, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          heading!,
          style: TextStyles.medium12.copyWith(
            color: AppColor.silver(Theme.of(context).brightness),
          ),
        ),
        Text(
          value!,
          style: TextStyles.medium15.copyWith(
            color: AppColor.dustyGray(Theme.of(context).brightness),
          ),
        ),
      ],
    );
  }
}
