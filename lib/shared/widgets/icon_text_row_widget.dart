import 'package:flutter/material.dart';
import 'package:pregnant_education/core/themes/app_colors.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';

Widget iconTextRow({required IconData icon, required String text}) {
  return Row(
    children: [
      Icon(icon, size: AppSizes.base, color: AppColors.textSecondary),
      const SizedBox(width: AppSizes.small + 2),
      Text(
        text,
        style: TextStyle(
          fontSize: AppSizes.medium + 2,
          color: AppColors.textSecondary,
        ),
      ),
    ],
  );
}
