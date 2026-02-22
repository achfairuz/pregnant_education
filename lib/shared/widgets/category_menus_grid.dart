import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pregnant_education/core/themes/app_colors.dart';
import 'package:pregnant_education/core/themes/app_padding.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/core/themes/app_text_style.dart';

class CategoryMenusGrid extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  final String routePrefix;
  final int crossAxisCount;
  final String type;
  const CategoryMenusGrid({
    super.key,
    required this.data,
    required this.routePrefix,
    required this.crossAxisCount,
    required this.type,
  });

  @override
  State<CategoryMenusGrid> createState() => _CategoryMenusGridState();
}

class _CategoryMenusGridState extends State<CategoryMenusGrid> {
  @override
  Widget build(BuildContext context) {
    // Ambil maksimal 6 data
    final limitedData = widget.data.length > 6
        ? widget.data.take(6).toList()
        : widget.data;
    return Padding(
      padding: AppPadding.screenPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Categories', style: AppTextStyle.body),
              InkWell(
                onTap: () {
                  context.push(
                    '/show-all/${widget.type}',
                    extra: {'data': widget.data},
                  );
                },
                child: Text('Show All', style: AppTextStyle.body),
              ),
            ],
          ),
          SizedBox(height: AppSizes.medium),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: limitedData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.crossAxisCount,
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
                routePrefix: widget.routePrefix,
                data: item,
              );
            },
          ),
        ],
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
    // Check if imageUrl is a network URL or local asset
    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return Image.network(
        imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            width: 60,
            height: 60,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
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
