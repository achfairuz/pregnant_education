import 'package:flutter/widgets.dart';
import 'package:pregnant_education/core/themes/app_colors.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';

class AppTextStyle {
  static const String fontFamily = 'Poppins';

  static TextStyle headingWhite = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.extraLarge,
    color: AppColors.background,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.extraLarge,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headingSecondary = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.extraLarge,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.normal,
  );

  static TextStyle subheading = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.large,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.base,
    fontWeight: FontWeight.w500,
  );

  static TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.base - 2,
    fontWeight: FontWeight.normal,
  );

  static TextStyle menuName = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
  );
}
