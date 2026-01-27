import 'dart:ffi';

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
  final String routeShowAll;
  const CategoryMenusGrid({
    super.key,
    required this.data,
    required this.routePrefix,
    required this.crossAxisCount,
    required this.routeShowAll,
  });

  @override
  State<CategoryMenusGrid> createState() => _CategoryMenusGridState();
}

class _CategoryMenusGridState extends State<CategoryMenusGrid> {
  @override
  Widget build(BuildContext context) {
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
                  context.push(widget.routeShowAll);
                },
                child: Text('Show All', style: AppTextStyle.body),
              ),
            ],
          ),
          SizedBox(height: AppSizes.medium),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.data.length,
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

  const _CategoryCard({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.routePrefix,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('$routePrefix/$id/$name');
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
              Image.asset(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported),
              ),
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
}
