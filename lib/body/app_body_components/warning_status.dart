import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/body/app_body_components/warning_status_components/warning_info.dart';
import 'package:warm_cloud/body/app_body_components/warning_status_components/warning_title.dart';

class WarningStatus extends StatelessWidget {
  const WarningStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.hintOfRed(Theme.of(context).brightness),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WarningInfo(),
          //const SizedBox(height: 20,),
          WarningTitle(),
        ],
      ),
    );
  }
}
