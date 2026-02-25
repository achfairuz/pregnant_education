class AppRoutes {
  static const education = '/education';
  static const detailEducation = '/education/detail/:id';

  static const scan = '/scan';

  static const recipes = '/recipes';
  static const detailRecipe = '/recipe/detail/:id';

  static const itemByCategory = 'category/:id/:name';

  static const String showAll = '/show-all/:type';

  static const List<String> bottomNavRoutes = [education, scan, recipes];

  static const about = '/about';
}
