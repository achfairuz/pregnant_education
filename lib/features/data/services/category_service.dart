import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pregnant_education/features/data/models/category_model.dart';

class CategoryService {
  Future<CategoryResponse> getCategories(String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return CategoryResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}
