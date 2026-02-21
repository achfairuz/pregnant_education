import 'package:flutter/material.dart';
import 'package:pregnant_education/core/themes/app_colors.dart';
import 'package:pregnant_education/core/themes/app_padding.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/core/themes/app_text_style.dart';
import 'package:pregnant_education/features/data/repositories/recipe/recipe_repository.dart';
import 'package:pregnant_education/shared/widgets/icon_button_back_with_name_page_widget.dart';
import 'package:pregnant_education/shared/widgets/icon_text_row_widget.dart';
import 'package:pregnant_education/shared/widgets/nutrition_capsule_widget.dart';
import 'package:pregnant_education/shared/widgets/text_list_section_widget.dart';

class DetailRecipePage extends StatefulWidget {
  final String id;
  final Map<String, dynamic> data;
  const DetailRecipePage({super.key, required this.id, required this.data});

  @override
  State<DetailRecipePage> createState() => _DetailRecipePageState();
}

class _DetailRecipePageState extends State<DetailRecipePage> {
  final RecipeRepository _repository = RecipeRepository();
  Map<String, dynamic>? _recipeData;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadRecipeDetail();
  }

  Future<void> _loadRecipeDetail() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final recipeDetail = await _repository.getRecipeDetail(widget.id);

      setState(() {
        _recipeData = recipeDetail;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Gagal memuat detail resep: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                if (_isLoading)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (_errorMessage != null)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            _errorMessage!,
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _loadRecipeDetail,
                            child: const Text('Coba Lagi'),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (_recipeData != null)
                  _buildRecipeContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeContent() {
    // Parse ingredients from API response
    final ingredients = (_recipeData!["ingredients"] as List<dynamic>)
        .map((item) => item.ingredient as String)
        .toList();

    // Parse steps from API response
    final steps = (_recipeData!["steps"] as List<dynamic>)
        .map((item) => item.step as String)
        .toList();

    // Parse nutritions from API response
    final nutritions = _recipeData!["nutritions"] as List<dynamic>;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerRecipe(
          imageUrl: _recipeData!["imageUrl"],
          title: _recipeData!["title"],
          portion: _recipeData!["portion"],
          duration: _recipeData!["duration"],
        ),
        SizedBox(height: AppSizes.large),
        textListSection(
          items: ingredients,
          title: "Bahan-bahan",
        ),
        SizedBox(height: AppSizes.base),
        textListSection(
          items: steps,
          title: "Langkah-langkah",
          numbered: true,
        ),
        SizedBox(height: AppSizes.doubleExtraLarge),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: nutritions
                .map<Widget>(
                  (item) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: nutritionCapsule(
                      label: item.label,
                      value: item.value,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
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
        backgroundImage: imageUrl.startsWith('http')
            ? NetworkImage(imageUrl)
            : AssetImage(imageUrl) as ImageProvider,
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
