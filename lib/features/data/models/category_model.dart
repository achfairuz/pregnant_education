class CategoryResponse {
  final String status;
  final List<Category> data;

  CategoryResponse({
    required this.status,
    required this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class Category {
  final int id;
  final String name;
  final String imageUrl;
  final String type;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
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

  // Convert to Map<String, dynamic> for widget compatibility
  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
