import 'package:flutter/material.dart';
import 'package:pregnant_education/features/pages/education/education_page.dart';
import 'package:pregnant_education/features/pages/recipe/recipe_page.dart';
import 'package:pregnant_education/features/pages/scan/scan_page.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.education: (_) => const EducationPage(),
    AppRoutes.scan: (_) => const ScanPage(),
    AppRoutes.recipes: (_) => const RecipePage(),
  };
}
