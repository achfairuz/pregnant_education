import 'package:flutter/material.dart';
import 'package:pregnant_education/core/themes/app_padding.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/features/data/repositories/education/education_repository.dart';
import 'package:pregnant_education/shared/widgets/list_item_by_category_education.dart';
import 'package:pregnant_education/shared/widgets/search_input_custom.dart';

class EducationByCategoryPage extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  const EducationByCategoryPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<EducationByCategoryPage> createState() =>
      _EducationByCategoryPageState();
}

class _EducationByCategoryPageState extends State<EducationByCategoryPage> {
  final TextEditingController _searchController = TextEditingController();
  final EducationRepository _repository = EducationRepository();
  List<Map<String, dynamic>> _educations = [];
  List<Map<String, dynamic>> _filteredEducations = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadEducations();
    _searchController.addListener(_filterEducations);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterEducations);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadEducations() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final categoryId = int.parse(widget.categoryId);
      final educations = await _repository.getEducationsByCategoryAsMap(categoryId);
      
      setState(() {
        _educations = educations;
        _filteredEducations = educations;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Gagal memuat edukasi: $e';
        _isLoading = false;
      });
    }
  }

  void _filterEducations() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredEducations = _educations;
      } else {
        _filteredEducations = _educations.where((education) {
          final title = education['title'].toString().toLowerCase();
          return title.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: AppSizes.base),
              Row(
                children: [
                  BackButton(),
                  SizedBox(width: AppSizes.small),
                  Expanded(
                    child: searchInputCustom(
                          controller: _searchController,
                          hintText: "Search education...",
                          onClear: () => _searchController.clear(),
                        ),
                  ),
                  SizedBox(width: AppSizes.small),
                ],
              ),
              Padding(
                padding: AppPadding.screenPadding,
                child: Column(
                  children: [                  
                    SizedBox(height: AppSizes.large),
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
                              onPressed: _loadEducations,
                              child: const Text('Coba Lagi'),
                            ),
                          ],
                        ),
                      )
                    else
                      ListItemByCategoryEducation(
                        prefixDetailPage: '/education',
                        categoryName: widget.categoryName,
                        data: _filteredEducations,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
