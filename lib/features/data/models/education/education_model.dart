class EducationByCategoryResponse {
  final String status;
  final EducationPaginationData data;

  EducationByCategoryResponse({required this.status, required this.data});

  factory EducationByCategoryResponse.fromJson(Map<String, dynamic> json) {
    return EducationByCategoryResponse(
      status: json['status'] as String,
      data: EducationPaginationData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': data.toJson()};
  }
}

class EducationPaginationData {
  final int currentPage;
  final List<Education> data;
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

  EducationPaginationData({
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

  factory EducationPaginationData.fromJson(Map<String, dynamic> json) {
    return EducationPaginationData(
      currentPage: json['current_page'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Education.fromJson(e as Map<String, dynamic>))
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

class Education {
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final String slug;
  final String? link;

  Education({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
    this.link,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      categoryId: json['category_id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      slug: json['slug'] as String,
      link: json['link'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'category_id': categoryId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'slug': slug,
      'link': link,
    };
  }

  // Convert to Map<String, dynamic> for widget compatibility
  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'slug': slug,
      'link': link,
    };
  }
}

class PaginationLink {
  final String? url;
  final String label;
  final bool active;

  PaginationLink({this.url, required this.label, required this.active});

  factory PaginationLink.fromJson(Map<String, dynamic> json) {
    return PaginationLink(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'url': url, 'label': label, 'active': active};
  }
}
