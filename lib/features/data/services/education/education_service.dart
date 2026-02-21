import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pregnant_education/core/constants/api_endpoint.dart';
import 'package:pregnant_education/features/data/models/education/education_model.dart';

class EducationService {
  Future<EducationByCategoryResponse> getEducationsByCategory(int categoryId) async {
    try {
      final response = await http.get(
        Uri.parse(ApiEndpoint.educationByCategory(categoryId)),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return EducationByCategoryResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load educations: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load educations: $e');
    }
  }
}
