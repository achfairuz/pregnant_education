import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pregnant_education/core/constants/api_endpoint.dart';
import 'package:pregnant_education/features/data/models/recipe/category_recipe_model.dart';

class CategoryRecipeService {
  Future<CategoryRecipeResponse> getCategoryRecipes() async {
    try {
      final response = await http.get(
        Uri.parse(ApiEndpoint.categoryRecipe),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return CategoryRecipeResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load category recipes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load category recipes: $e');
    }
  }
}
