import 'package:flutter/material.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/core/themes/app_text_style.dart';

Widget textListSection({
  required String title,
  required List<String> items,
  bool numbered = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: AppTextStyle.subheading),
      SizedBox(height: AppSizes.base),
      ...items.asMap().entries.map((entry) {
        final index = entry.key;
        final text = entry.value;

        return Padding(
          padding: EdgeInsets.only(bottom: AppSizes.base / 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                numbered ? '${index + 1}. ' : '',
                style: AppTextStyle.caption,
              ),
              Expanded(child: Text(text, style: AppTextStyle.caption)),
            ],
          ),
        );
      }).toList(),
    ],
  );
}
