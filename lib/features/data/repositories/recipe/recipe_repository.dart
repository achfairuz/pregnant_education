import 'package:pregnant_education/features/data/models/recipe/recipe_model.dart';
import 'package:pregnant_education/features/data/services/recipe/recipe_service.dart';

class RecipeRepository {
  final RecipeService _service = RecipeService();

  Future<List<Recipe>> getRecipesByCategory(int categoryId) async {
    try {
      final response = await _service.getRecipesByCategory(categoryId);
      return response.data.data;
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getRecipesByCategoryAsMap(int categoryId) async {
    try {
      final recipes = await getRecipesByCategory(categoryId);
      return recipes.map((recipe) => recipe.toMap()).toList();
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }

  Future<Map<String, dynamic>> getRecipeDetail(String slug) async {
    try {
      final response = await _service.getRecipeDetail(slug);
      return response.data.toMap();
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}
