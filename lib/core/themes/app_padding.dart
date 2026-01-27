import 'package:flutter/material.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';

class AppPadding {
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: AppSizes.large,
    vertical: AppSizes.extraLarge,
  );

  static const EdgeInsets cardPadding = EdgeInsets.all(AppSizes.small);

  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    vertical: AppSizes.small,
    horizontal: AppSizes.base - 2,
  );

  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    vertical: AppSizes.small,
    horizontal: AppSizes.extraLarge,
  );

  static const EdgeInsets containerPadding = EdgeInsets.symmetric(
    vertical: AppSizes.extraLarge,
    horizontal: AppSizes.large,
  );
}
