import 'package:flutter/material.dart';
import 'package:pregnant_education/core/themes/app_colors.dart';

Widget searchInputCustom({
  required TextEditingController controller,
  required String hintText,
  VoidCallback? onClear,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon: controller.text.isNotEmpty
          ? IconButton(icon: const Icon(Icons.clear), onPressed: onClear)
          : Icon(Icons.search, color: AppColors.secondary),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.grey[200],
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 16.0,
      ),
    ),
  );
}
