class ApiEndpoint {
  static const String baseUrl = 'https://si-cerdas-production.up.railway.app/api';
  static const String categoryRecipe = '$baseUrl/category/recipe';
  static const String categoryEducation = '$baseUrl/category/education';
  static educationByCategory(int id) => '$baseUrl/education/$id';
  static recipeByCategory(int id) => '$baseUrl/recipe/$id';
  static detailEducation(String slug) => '$baseUrl/detail-education/$slug';
  static detailRecipe(String slug) => '$baseUrl/detail-recipe/$slug';
}