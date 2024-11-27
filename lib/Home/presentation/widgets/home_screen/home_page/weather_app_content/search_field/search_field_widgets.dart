import 'package:flutter/material.dart';
import 'package:warm_cloud/core/CustomWidgets/custom_card.dart';
import 'package:warm_cloud/core/app_color/app_color.dart';
import 'package:warm_cloud/core/styles/text_styles.dart';

class SearchFieldWidgets extends StatelessWidget {
  const SearchFieldWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      paddingValue: 4,
      child: ListTile(
        title: Text(
          "Search Location",
          style: TextStyles.regular15.copyWith(
            color: AppColor.silver(Theme.of(context).brightness),
          ),
        ),
        trailing: Icon(
          Icons.search,
          color: AppColor.silver(Theme.of(context).brightness),
        ),
      ),
    );
  }
}
