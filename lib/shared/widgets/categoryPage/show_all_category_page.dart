import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pregnant_education/core/themes/app_colors.dart';
import 'package:pregnant_education/core/themes/app_padding.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/core/themes/app_text_style.dart';

class ShowAllCategoryPage extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  final String type;

  const ShowAllCategoryPage({
    super.key,
    required this.data,
    required this.type,
  });

  @override
  State<ShowAllCategoryPage> createState() => _ShowAllCategoryPageState();
}

class _ShowAllCategoryPageState extends State<ShowAllCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Categories', style: AppTextStyle.body)),
      body: Padding(
        padding: AppPadding.screenPadding,
        child: GridView.builder(
          itemCount: widget.data.length, // ✅ tampilkan semua
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSizes.large,
            crossAxisSpacing: AppSizes.medium,
            mainAxisExtent: 200,
          ),
          itemBuilder: (context, index) {
            final item = widget.data[index];

            return _CategoryCard(
              id: item['id'] ?? '',
              name: item['name'] ?? '',
              imageUrl: item['imageUrl'] ?? '',
              routePrefix: '/${widget.type}/category',
              data: item,
            );
          },
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final String routePrefix;
  final Map<String, dynamic> data;

  const _CategoryCard({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.routePrefix,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('$routePrefix/$id/$name', extra: {'data': data});
      },
      child: Card(
        surfaceTintColor: AppColors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: AppPadding.cardPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImage(),
              const SizedBox(height: AppSizes.medium),
              Text(
                name,
                style: AppTextStyle.menuName,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            const Icon(Icons.image_not_supported, size: 60),
      );
    } else {
      return Image.asset(
        imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            const Icon(Icons.image_not_supported, size: 60),
      );
    }
  }
}
