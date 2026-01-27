import 'package:flutter/material.dart';
import 'package:pregnant_education/core/constants/app_assets.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/features/data/dummy/education/category_education_data_dummy.dart';
import 'package:pregnant_education/shared/widgets/category_menus_grid.dart';
import 'package:pregnant_education/shared/widgets/section_header_with_search.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SectionHeaderWithSearch(
              icon: AppAssets.iconEducation,
              title: 'Hai, Ibu!',
              subtitle:
                  'Yuk pantau kesehatan dan gizi ibu untuk mencegah stunting pada anak.',
              hintText: 'Search education',
            ),
            SizedBox(height: AppSizes.base),
            CategoryMenusGrid(
              data: categoryDataDummy,
              routePrefix: '/education/category',
              crossAxisCount: 3,
              routeShowAll: '/education/category',
            ),
          ],
        ),
      ),
    );
  }
}
