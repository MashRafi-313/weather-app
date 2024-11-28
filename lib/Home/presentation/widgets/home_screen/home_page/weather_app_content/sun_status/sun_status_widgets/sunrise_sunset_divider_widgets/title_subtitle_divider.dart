import 'package:flutter/material.dart';
import 'package:warm_cloud/core/app_color/app_color.dart';
import 'package:warm_cloud/core/styles/text_styles.dart';

import 'vertical_divider.dart';

class TitleSubtitleDivider extends StatelessWidget {
  final String? heading;
  final String? value;

  const TitleSubtitleDivider(
      {super.key, required this.heading, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          heading!,
          style: TextStyles.regular10
              .copyWith(color: AppColor.silver(Theme.of(context).brightness)),
        ),
        Text(
          value!,
          style: TextStyles.regular12.copyWith(
            color: AppColor.dustyGray(Theme.of(context).brightness),
          ),
        ),
        SizedBox(
          height: 60,
          child: Verticaldivider(),
        ),
      ],
    );
  }
}
