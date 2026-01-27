import 'package:flutter/material.dart';
import 'package:pregnant_education/core/constants/app_assets.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/features/data/dummy/recipe/category_recipe_data_dummy.dart';
import 'package:pregnant_education/shared/widgets/category_menus_grid.dart';
import 'package:pregnant_education/shared/widgets/section_header_with_search.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SectionHeaderWithSearch(
              icon: AppAssets.iconRecipe,
              subtitle:
                  "Temukan resep sehat yang anda butuhkan untuk tumbuh kembang si kecil",
            ),
            SizedBox(height: AppSizes.base),
            CategoryMenusGrid(
              data: categoryRecipeDataDummy,
              crossAxisCount: 3,
              routePrefix: '/recipes/category',
              routeShowAll: '/',
            ),
          ],
        ),
      ),
    );
  }
}
