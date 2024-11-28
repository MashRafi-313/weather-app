import 'package:flutter/material.dart';
import 'package:warm_cloud/core/app_color/app_color.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        80,
        (index) {
          return Expanded(
            child: Divider(
              height: 0,
              color: AppColor.silver(
                  Theme.of(context).brightness), // Customize color if needed
              thickness: 0.5,
              indent: 1.5, // Customize thickness if needed
            ),
          );
        },
        growable: true,
      ),
    );
  }
}
