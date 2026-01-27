import 'package:flutter/material.dart';
import 'package:pregnant_education/core/themes/app_padding.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:pregnant_education/core/themes/app_text_style.dart';
import 'package:pregnant_education/features/data/dummy/education/education_data_dummy.dart';
import 'package:pregnant_education/shared/widgets/icon_button_back_with_name_page_widget.dart';
import 'package:pregnant_education/shared/widgets/text_html_widget.dart';
import 'package:pregnant_education/shared/widgets/video_yt_player_widget.dart';

class DetailEducationPage extends StatefulWidget {
  final String id;
  const DetailEducationPage({super.key, required this.id});

  @override
  State<DetailEducationPage> createState() => _DetailEducationPageState();
}

class _DetailEducationPageState extends State<DetailEducationPage> {
  @override
  Widget build(BuildContext context) {
    final data = educationDataDummy.firstWhere(
      (element) => element['id'] == widget.id,
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                iconButtonBackWithNamePageWidget(
                  context: context,
                  pageName: "Detail Education",
                ),
                SizedBox(height: AppSizes.base),
                (data['youtubeUrl'] != null &&
                        data['youtubeUrl'].toString().isNotEmpty)
                    ? YoutubePlayerWidget(youtubeUrl: data['youtubeUrl'])
                    : Image.asset(
                        data['imageUrl'],
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                SizedBox(height: AppSizes.base),
                Text(data['title'], style: AppTextStyle.heading),
                TextHtmlWidget(htmlData: data['body']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
