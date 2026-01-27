import 'package:flutter/material.dart';
import 'package:pregnant_education/core/themes/app_text_style.dart';

Widget iconButtonBackWithNamePageWidget({
  required BuildContext context,
  required String pageName,
}) {
  return Row(
    children: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      Text(pageName, style: AppTextStyle.subheading),
    ],
  );
}
