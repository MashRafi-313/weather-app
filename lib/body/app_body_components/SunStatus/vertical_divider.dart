import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_color/app_color.dart';

class Verticaldivider extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        20,
            (index) {
          return Expanded(
            child: VerticalDivider(
              color: AppColor.silver(Theme.of(context).brightness), // Customize color if needed
              thickness: 0.5,
              indent: 1,
              // Customize thickness if needed
            ),
          );
        },
      ),
    );
  }
}