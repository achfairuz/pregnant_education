import 'package:flutter/material.dart';
import 'package:pregnant_education/core/themes/app_padding.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/features/data/repositories/recipe/recipe_repository.dart';
import 'package:pregnant_education/shared/widgets/list_item_by_category_recipe.dart';
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
  final RecipeRepository _repository = RecipeRepository();
  List<Map<String, dynamic>> _recipes = [];
  List<Map<String, dynamic>> _filteredRecipes = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
    _searchController.addListener(_filterRecipes);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterRecipes);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadRecipes() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final categoryId = int.parse(widget.categoryId);
      final recipes = await _repository.getRecipesByCategoryAsMap(categoryId);
      
      setState(() {
        _recipes = recipes;
        _filteredRecipes = recipes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Gagal memuat resep: $e';
        _isLoading = false;
      });
    }
  }

  void _filterRecipes() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredRecipes = _recipes;
      } else {
        _filteredRecipes = _recipes.where((recipe) {
          final title = recipe['title'].toString().toLowerCase();
          return title.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: AppSizes.base),
              Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackButton(),
                      SizedBox(width: AppSizes.small),
                      Expanded(
                        child: searchInputCustom(
                          controller: _searchController,
                          hintText: "Search recipe...",
                          onClear: () => _searchController.clear(),
                        ),
                      ),
                      SizedBox(width: AppSizes.small),
                    ],
                  ),
              Padding(
                padding: AppPadding.screenPadding,
                child: Column(
                  children: [
                    SizedBox(height: AppSizes.large),
                    if (_isLoading)
                      const Padding(
                        padding: EdgeInsets.all(32.0),
                        child: CircularProgressIndicator(),
                      )
                    else if (_errorMessage != null)
                      Padding(
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
                              onPressed: _loadRecipes,
                              child: const Text('Coba Lagi'),
                            ),
                          ],
                        ),
                      )
                    else
                      ListItemByCategoryRecipe(
                        prefixDetailPage: '/recipe',
                        categoryName: widget.categoryName,
                        data: _filteredRecipes,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
