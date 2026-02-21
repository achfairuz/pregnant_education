import 'package:pregnant_education/core/constants/api_endpoint.dart';
import 'package:pregnant_education/features/data/models/category_model.dart';
import 'package:pregnant_education/features/data/services/category_service.dart';

class CategoryRepository {
  final CategoryService _service = CategoryService();

  Future<List<Category>> getCategoryRecipes() async {
    try {
      final response = await _service.getCategories(ApiEndpoint.categoryRecipe);
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

  Future<List<Category>> getCategoryEducation() async {
    try {
      final response = await _service.getCategories(ApiEndpoint.categoryEducation);
      return response.data;
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getCategoryEducationAsMap() async {
    try {
      final categories = await getCategoryEducation();
      return categories.map((category) => category.toMap()).toList();
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}
