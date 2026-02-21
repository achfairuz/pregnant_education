import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pregnant_education/core/themes/app_padding.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/core/themes/app_text_style.dart';
import 'package:pregnant_education/shared/helpers/html_excerpt_helper.dart';
import 'package:pregnant_education/shared/helpers/limit_words_helper.dart';

class ListItemByCategoryEducation extends StatefulWidget {
  final String categoryName;
  final List<Map<String, dynamic>> data;
  final String prefixDetailPage;

  const ListItemByCategoryEducation({
    super.key,
    required this.categoryName,
    required this.data,
    required this.prefixDetailPage,
  });

  @override
  State<ListItemByCategoryEducation> createState() => _ListItemByCategoryEducationState();
}

class _ListItemByCategoryEducationState extends State<ListItemByCategoryEducation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.categoryName, style: AppTextStyle.subheading),
        SizedBox(height: AppSizes.base),
        (widget.data.isNotEmpty)
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.data.length,
                itemBuilder: (context, index) {
                  final item = widget.data[index];
                  return _listCard(
                    context: context,
                    id: item['id'],
                    title: item['title'],
                    description: item['description'] ?? '',
                    imageUrl: item['imageUrl'] ?? '',
                    prefixDetailPage: widget.prefixDetailPage,
                    data: item,
                  );
                },
              )
            : SizedBox(
                height: 200, // atau MediaQuery
                child: Center(
                  child: Text(
                    'Tidak ada data',
                    style: AppTextStyle.body.copyWith(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
      ],
    );
  }
}

Widget _listCard({
  required BuildContext context,
  required String id,
  required String title,
  required String prefixDetailPage,
  required Map<String, dynamic> data,
  String? description,
  String imageUrl = '',
}) {
  return Card(
    child: Padding(
      padding: AppPadding.listItemPadding,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: _getImageProvider(imageUrl),
          backgroundColor: Colors.grey[200],
          onBackgroundImageError: (_, __) {},
        ),
        title: Text(title),
        subtitle: (description != null && description.isNotEmpty)
            ? Text(
                extractParagraphText(limitWords(description, 15)),
                textAlign: TextAlign.justify,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            : null,

        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          GoRouter.of(context).push('$prefixDetailPage/detail/$id', extra: data);
        },
      ),
    ),
  );
}

ImageProvider _getImageProvider(String imageUrl) {
  if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
    return NetworkImage(imageUrl);
  } else if (imageUrl.isNotEmpty) {
    return AssetImage(imageUrl);
  } else {
    return const AssetImage('assets/images/icons/placeholder.png');
  }
}
