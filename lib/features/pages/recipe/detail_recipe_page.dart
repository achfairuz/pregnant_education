import 'package:flutter/material.dart';
import 'package:pregnant_education/core/themes/app_colors.dart';
import 'package:pregnant_education/core/themes/app_padding.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/core/themes/app_text_style.dart';
import 'package:pregnant_education/features/data/dummy/recipe/recipe_data_dummy.dart';
import 'package:pregnant_education/shared/widgets/icon_button_back_with_name_page_widget.dart';
import 'package:pregnant_education/shared/widgets/icon_text_row_widget.dart';
import 'package:pregnant_education/shared/widgets/nutrition_capsule_widget.dart';
import 'package:pregnant_education/shared/widgets/text_list_section_widget.dart';

class DetailRecipePage extends StatefulWidget {
  final String id;
  const DetailRecipePage({super.key, required this.id});

  @override
  State<DetailRecipePage> createState() => _DetailRecipePageState();
}

class _DetailRecipePageState extends State<DetailRecipePage> {
  @override
  Widget build(BuildContext context) {
    final data = recipeDataDummy.firstWhere(
      (recipe) => recipe["id"] == widget.id,
    );

    final nutrition = data["nutrition"] as Map<String, dynamic>;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                iconButtonBackWithNamePageWidget(
                  context: context,
                  pageName: "Detail Recipe",
                ),
                SizedBox(height: AppSizes.base),
                _headerRecipe(
                  imageUrl: data["imageUrl"],
                  title: data["title"],
                  portion: data["portion"],
                  duration: data["duration"],
                ),
                SizedBox(height: AppSizes.large),
                textListSection(
                  items: data["ingredients"] as List<String>,
                  title: "Bahan-bahan",
                ),
                SizedBox(height: AppSizes.base),
                textListSection(
                  items: data["steps"] as List<String>,
                  title: "Langkah-langkah",
                  numbered: true,
                ),

                SizedBox(height: AppSizes.doubleExtraLarge),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: nutrition.values
                        .map<Widget>(
                          (item) => Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: nutritionCapsule(
                              label: item['label'],
                              value: item['value'],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _headerRecipe({
  required String imageUrl,
  required String title,
  required String portion,
  required String duration,
}) {
  return Row(
    children: [
      CircleAvatar(
        radius: 32,
        backgroundImage: AssetImage(imageUrl),
        backgroundColor: AppColors.textSecondary,
      ),

      SizedBox(width: AppSizes.base),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyle.subheading),
            SizedBox(height: AppSizes.base / 2),
            iconTextRow(icon: Icons.restaurant, text: portion),
            SizedBox(height: AppSizes.base / 4),
            iconTextRow(icon: Icons.timer_outlined, text: duration),
          ],
        ),
      ),
    ],
  );
}
