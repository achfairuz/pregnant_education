class RecipeByCategoryResponse {
  final String status;
  final RecipePaginationData data;

  RecipeByCategoryResponse({
    required this.status,
    required this.data,
  });

  factory RecipeByCategoryResponse.fromJson(Map<String, dynamic> json) {
    return RecipeByCategoryResponse(
      status: json['status'] as String,
      data: RecipePaginationData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class RecipePaginationData {
  final int currentPage;
  final List<Recipe> data;
  final String firstPageUrl;
  final int? from;
  final int lastPage;
  final String lastPageUrl;
  final List<PaginationLink> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int? to;
  final int total;

  RecipePaginationData({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory RecipePaginationData.fromJson(Map<String, dynamic> json) {
    return RecipePaginationData(
      currentPage: json['current_page'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int,
      lastPageUrl: json['last_page_url'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String,
      perPage: json['per_page'] as int,
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] as int?,
      total: json['total'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'data': data.map((e) => e.toJson()).toList(),
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'links': links.map((e) => e.toJson()).toList(),
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'prev_page_url': prevPageUrl,
      'to': to,
      'total': total,
    };
  }
}

class Recipe {
  final int id;
  final String title;
  final String imageUrl;
  final String portion;
  final String duration;
  final String? description;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final String slug;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.portion,
    required this.duration,
    this.description,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      portion: json['portion'] as String,
      duration: json['duration'] as String,
      description: json['description'] as String?,
      categoryId: json['category_id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      slug: json['slug'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'portion': portion,
      'duration': duration,
      'description': description,
      'category_id': categoryId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'slug': slug,
    };
  }

  // Convert to Map<String, dynamic> for widget compatibility
  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'title': title,
      'imageUrl': imageUrl,
      'portion': portion,
      'duration': duration,
      'description': description,
      'slug': slug,
    };
  }
}

class PaginationLink {
  final String? url;
  final String label;
  final bool active;

  PaginationLink({
    this.url,
    required this.label,
    required this.active,
  });

  factory PaginationLink.fromJson(Map<String, dynamic> json) {
    return PaginationLink(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'label': label,
      'active': active,
    };
  }
}

// Recipe Detail Models
class RecipeDetailResponse {
  final String status;
  final RecipeDetail data;

  RecipeDetailResponse({
    required this.status,
    required this.data,
  });

  factory RecipeDetailResponse.fromJson(Map<String, dynamic> json) {
    return RecipeDetailResponse(
      status: json['status'] as String,
      data: RecipeDetail.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class RecipeDetail {
  final int id;
  final String title;
  final String imageUrl;
  final String portion;
  final String duration;
  final String? description;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final String slug;
  final RecipeCategory category;
  final List<RecipeIngredient> ingredients;
  final List<RecipeStep> steps;
  final List<RecipeNutrition> nutritions;

  RecipeDetail({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.portion,
    required this.duration,
    this.description,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
    required this.category,
    required this.ingredients,
    required this.steps,
    required this.nutritions,
  });

  factory RecipeDetail.fromJson(Map<String, dynamic> json) {
    return RecipeDetail(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      portion: json['portion'] as String,
      duration: json['duration'] as String,
      description: json['description'] as String?,
      categoryId: json['category_id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      slug: json['slug'] as String,
      category: RecipeCategory.fromJson(json['category'] as Map<String, dynamic>),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => RecipeIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      nutritions: (json['nutritions'] as List<dynamic>)
          .map((e) => RecipeNutrition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'portion': portion,
      'duration': duration,
      'description': description,
      'category_id': categoryId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'slug': slug,
      'category': category.toJson(),
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      'steps': steps.map((e) => e.toJson()).toList(),
      'nutritions': nutritions.map((e) => e.toJson()).toList(),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'portion': portion,
      'duration': duration,
      'description': description,
      'slug': slug,
      'category': category.toMap(),
      'ingredients': ingredients,
      'steps': steps,
      'nutritions': nutritions,
    };
  }
}

class RecipeCategory {
  final int id;
  final String name;
  final String imageUrl;
  final String type;
  final String createdAt;
  final String updatedAt;

  RecipeCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RecipeCategory.fromJson(Map<String, dynamic> json) {
    return RecipeCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'type': type,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}

class RecipeIngredient {
  final int id;
  final int recipeId;
  final String ingredient;
  final int order;
  final String createdAt;
  final String updatedAt;

  RecipeIngredient({
    required this.id,
    required this.recipeId,
    required this.ingredient,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) {
    return RecipeIngredient(
      id: json['id'] as int,
      recipeId: json['recipe_id'] as int,
      ingredient: json['ingredient'] as String,
      order: json['order'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recipe_id': recipeId,
      'ingredient': ingredient,
      'order': order,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class RecipeStep {
  final int id;
  final int recipeId;
  final String step;
  final int order;
  final String createdAt;
  final String updatedAt;

  RecipeStep({
    required this.id,
    required this.recipeId,
    required this.step,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RecipeStep.fromJson(Map<String, dynamic> json) {
    return RecipeStep(
      id: json['id'] as int,
      recipeId: json['recipe_id'] as int,
      step: json['step'] as String,
      order: json['order'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recipe_id': recipeId,
      'step': step,
      'order': order,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class RecipeNutrition {
  final int id;
  final int recipeId;
  final String key;
  final String label;
  final String value;
  final String createdAt;
  final String updatedAt;

  RecipeNutrition({
    required this.id,
    required this.recipeId,
    required this.key,
    required this.label,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RecipeNutrition.fromJson(Map<String, dynamic> json) {
    return RecipeNutrition(
      id: json['id'] as int,
      recipeId: json['recipe_id'] as int,
      key: json['key'] as String,
      label: json['label'] as String,
      value: json['value'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recipe_id': recipeId,
      'key': key,
      'label': label,
      'value': value,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
