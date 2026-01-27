import 'package:flutter/material.dart';
import 'package:pregnant_education/core/themes/app_padding.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/features/data/dummy/recipe/recipe_data_dummy.dart';
import 'package:pregnant_education/shared/widgets/list_item_by_category.dart';
import 'package:pregnant_education/shared/widgets/search_input_custom.dart';

class RecipeByCategoryPage extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  const RecipeByCategoryPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<RecipeByCategoryPage> createState() => _RecipeByCategoryPageState();
}

class _RecipeByCategoryPageState extends State<RecipeByCategoryPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              searchInputCustom(
                controller: _searchController,
                hintText: "Search education...",
              ),
              SizedBox(height: AppSizes.large),
              ListItemByCategory(
                prefixDetailPage: '/recipe',
                categoryName: widget.categoryName,
                data: recipeDataDummy
                    .where(
                      (education) =>
                          education['categoryId'] == widget.categoryId,
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
