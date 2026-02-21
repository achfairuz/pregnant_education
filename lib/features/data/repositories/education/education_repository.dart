import 'package:pregnant_education/features/data/models/education/education_model.dart';
import 'package:pregnant_education/features/data/services/education/education_service.dart';

class EducationRepository {
  final EducationService _service = EducationService();

  Future<List<Education>> getEducationsByCategory(int categoryId) async {
    try {
      final response = await _service.getEducationsByCategory(categoryId);
      return response.data.data;
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getEducationsByCategoryAsMap(int categoryId) async {
    try {
      final educations = await getEducationsByCategory(categoryId);
      return educations.map((education) => education.toMap()).toList();
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}
