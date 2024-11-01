import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_color/app_color.dart';

class LocationName extends StatelessWidget {
  final String? location;

  const LocationName({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: location,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
              color: AppColor.mineShaft(Theme.of(context).brightness),
            textBaseline:  TextBaseline.alphabetic
          ),
        ),
        TextSpan(text: "  "),
        WidgetSpan(
            child: Image.asset('assets/images/locationIndicator.png',
              color: AppColor.mineShaft(Theme.of(context).brightness),
            ),
            baseline: TextBaseline.alphabetic,
            alignment: PlaceholderAlignment.baseline,
            )
      ]),
    );
  }
}
