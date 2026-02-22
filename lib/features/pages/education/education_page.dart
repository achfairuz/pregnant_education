import 'package:flutter/material.dart';
import 'package:pregnant_education/core/constants/app_assets.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/features/data/repositories/category_repository.dart';
import 'package:pregnant_education/shared/widgets/category_menus_grid.dart';
import 'package:pregnant_education/shared/widgets/section_header_with_search.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final CategoryRepository _repository = CategoryRepository();
  List<Map<String, dynamic>> _categories = [];
  List<Map<String, dynamic>> _filteredCategories = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final categories = await _repository.getCategoryEducationAsMap();

      setState(() {
        _categories = categories;
        _filteredCategories = categories;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Gagal memuat kategori edukasi: $e';
        _isLoading = false;
      });
    }
  }

  void _filterCategories(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCategories = _categories;
      } else {
        _filteredCategories = _categories.where((category) {
          final title = category['name']?.toString().toLowerCase() ?? '';
          return title.contains(query.toLowerCase());
        }).toList();
      }
    });
  }

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
              onSearchChanged: _filterCategories,
            ),
            SizedBox(height: AppSizes.base),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: CircularProgressIndicator(),
              )
            else if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loadCategories,
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              )
            else
              CategoryMenusGrid(
                data: _filteredCategories,
                routePrefix: '/education/category',
                crossAxisCount: 3,
                type: 'education',
              ),
          ],
        ),
      ),
    );
  }
}
