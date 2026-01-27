import 'package:flutter/material.dart';
import 'package:pregnant_education/core/constants/app_assets.dart';
import 'package:pregnant_education/core/themes/app_colors.dart';
import 'package:pregnant_education/core/themes/app_padding.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/core/themes/app_text_style.dart';
import 'package:pregnant_education/shared/widgets/search_input_custom.dart';

class SectionHeaderWithSearch extends StatefulWidget {
  final String? title;
  final String subtitle;
  final String hintText;
  final String icon;
  const SectionHeaderWithSearch({
    super.key,
    this.title,
    required this.subtitle,
    this.hintText = 'Search',
    required this.icon,
  });

  @override
  State<SectionHeaderWithSearch> createState() =>
      _SectionHeaderWithSearchState();
}

class _SectionHeaderWithSearchState extends State<SectionHeaderWithSearch> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppPadding.containerPadding,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.small),
          bottomRight: Radius.circular(AppSizes.small),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeaderGreeting(
            title: widget.title,
            subtitle: widget.subtitle,
            icon: widget.icon,
          ),
          const SizedBox(height: AppSizes.large),
          searchInputCustom(controller: _controller, hintText: widget.hintText),
        ],
      ),
    );
  }
}

class _HeaderGreeting extends StatelessWidget {
  final String? title;
  final String subtitle;
  final String icon;

  const _HeaderGreeting({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icon, width: 80, height: 80),
        const SizedBox(width: AppSizes.small),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ...[
                Text(
                  title!,
                  style: AppTextStyle.heading.copyWith(
                    color: AppColors.background,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSizes.extrasmall),
              ],

              Text(
                subtitle,
                style: AppTextStyle.body.copyWith(
                  color: AppColors.background.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
