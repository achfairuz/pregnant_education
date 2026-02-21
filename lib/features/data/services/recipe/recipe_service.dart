import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pregnant_education/core/constants/api_endpoint.dart';
import 'package:pregnant_education/features/data/models/recipe/recipe_model.dart';

class RecipeService {
  Future<RecipeByCategoryResponse> getRecipesByCategory(int categoryId) async {
    try {
      final response = await http.get(
        Uri.parse(ApiEndpoint.recipeByCategory(categoryId)),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return RecipeByCategoryResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load recipes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load recipes: $e');
    }
  }

  Future<RecipeDetailResponse> getRecipeDetail(String slug) async {
    try {
      final response = await http.get(
        Uri.parse(ApiEndpoint.detailRecipe(slug)),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return RecipeDetailResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load recipe detail: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load recipe detail: $e');
    }
  }
}
