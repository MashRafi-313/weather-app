import 'package:flutter/material.dart';
import 'package:warm_cloud/core/styles/text_styles.dart';

import '../../../../../../../core/app_color/app_color.dart';

class LocationName extends StatelessWidget {
  final String? location;

  const LocationName({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: location,
          style: TextStyles.semibold30.copyWith(
            color: AppColor.mineShaft(Theme.of(context).brightness),
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        const TextSpan(text: "  "),
        WidgetSpan(
          child: Image.asset(
            'assets/images/locationIndicator.png',
            color: AppColor.mineShaft(Theme.of(context).brightness),
          ),
          baseline: TextBaseline.alphabetic,
          alignment: PlaceholderAlignment.baseline,
        )
      ]),
    );
  }
}
