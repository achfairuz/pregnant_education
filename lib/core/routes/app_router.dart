import 'package:go_router/go_router.dart';
import 'package:pregnant_education/features/pages/education/detail_education_page.dart';
import 'package:pregnant_education/features/pages/education/education_by_category_page/education_by_category_page.dart';
import 'package:pregnant_education/features/pages/recipe/detail_recipe_page.dart';
import 'package:pregnant_education/features/pages/recipe/recipe_by_category/recipe_by_category_page.dart';
import 'package:pregnant_education/features/pages/recipe/recipe_page.dart';
import 'package:pregnant_education/shared/layouts/shell_layout.dart';
import 'package:pregnant_education/shared/widgets/categoryPage/show_all_category_page.dart';

import '../../features/pages/education/education_page.dart';
import '../../features/pages/scan/scan_page.dart';
import '../routes/app_routes.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.education,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ShellLayout(child: child, location: state.uri.path);
      },
      routes: [
        GoRoute(
          path: AppRoutes.scan,
          builder: (context, state) => const ScanPage(),
        ),
        GoRoute(
          path: AppRoutes.showAll,
          builder: (context, state) {
            final type = state.pathParameters['type'] ?? '';

            final extra = state.extra as Map<String, dynamic>?;

            return ShowAllCategoryPage(type: type, data: extra?['data'] ?? []);
          },
        ),
        GoRoute(
          path: AppRoutes.recipes,
          builder: (context, state) => const RecipePage(),
          routes: [
            GoRoute(
              path: AppRoutes.itemByCategory,
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                final name = state.pathParameters['name']!;
                return RecipeByCategoryPage(categoryId: id, categoryName: name);
              },
            ),
          ],
        ),
        GoRoute(
          path: AppRoutes.education,
          builder: (context, state) => const EducationPage(),
          routes: [
            GoRoute(
              path: AppRoutes.itemByCategory,
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                final name = state.pathParameters['name']!;
                return EducationByCategoryPage(
                  categoryId: id,
                  categoryName: name,
                );
              },
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.detailEducation,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final data = state.extra as Map<String, dynamic>? ?? {};
        return DetailEducationPage(id: id, data: data);
      },
    ),
    GoRoute(
      path: AppRoutes.detailRecipe,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final data = state.extra as Map<String, dynamic>? ?? {};
        return DetailRecipePage(id: id, data: data);
      },
    ),
  ],
);
