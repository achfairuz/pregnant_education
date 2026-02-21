import 'package:pregnant_education/features/data/models/recipe/category_recipe_model.dart';
import 'package:pregnant_education/features/data/services/recipe/category_recipe_service.dart';

class CategoryRecipeRepository {
  final CategoryRecipeService _service = CategoryRecipeService();

  Future<List<CategoryRecipe>> getCategoryRecipes() async {
    try {
      final response = await _service.getCategoryRecipes();
      return response.data;
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getCategoryRecipesAsMap() async {
    try {
      final categories = await getCategoryRecipes();
      return categories.map((category) => category.toMap()).toList();
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}
