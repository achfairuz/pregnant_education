import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:http/http.dart' as http;
import 'package:pregnant_education/core/themes/app_colors.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class TextHtmlWidget extends StatefulWidget {
  final String htmlData;

  const TextHtmlWidget({super.key, required this.htmlData});

  @override
  State<TextHtmlWidget> createState() => _TextHtmlWidgetState();
}

class _TextHtmlWidgetState extends State<TextHtmlWidget> {
  Future<String?> getYoutubeTitle(String url) async {
    try {
      final uri = Uri.parse(
        "https://www.youtube.com/oembed?url=$url&format=json",
      );

      final res = await http.get(uri);

      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        return data["title"];
      }
    } catch (e) {}

    return null;
  }

  bool isYoutube(String url) {
    return url.contains("youtube.com") || url.contains("youtu.be");
  }

  String cleanHtml(String html) {
    return html.replaceAll(RegExp(r'<td>\s*</td>'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Html(
      data: cleanHtml(widget.htmlData),

      style: {
        "p": Style(
          textAlign: TextAlign.justify,
          fontSize: FontSize(AppSizes.medium + 2),
        ),

        "h1": Style(fontSize: FontSize(AppSizes.extraLarge)),

        "h2": Style(fontSize: FontSize(AppSizes.large)),

        "img": Style(
          margin: Margins.symmetric(vertical: 12),
          width: Width(200),
          display: Display.block,
          alignment: Alignment.center,
        ),

        /// STYLE TABLE
        "table": Style(
          margin: Margins.symmetric(vertical: 16),
          border: Border.all(color: Colors.grey.shade300),
          width: Width(375, Unit.percent),
        ),

        "td": Style(
          padding: HtmlPaddings.all(8),
          border: Border.all(color: Colors.grey.shade300),
          textAlign: TextAlign.center,
          width: Width.auto(),
        ),

        "th": Style(
          padding: HtmlPaddings.all(8),
          backgroundColor: AppColors.primary,
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          textAlign: TextAlign.center,
          width: Width.auto(),
        ),
      },

      onLinkTap: (url, attributes, element) {
        if (url != null) {
          launchUrl(Uri.parse(url));
        }
      },

      extensions: [
        /// EXTENSION TABLE (WAJIB UNTUK TABLE HTML)
        TableHtmlExtension(),

        /// YOUTUBE LINK TITLE
        TagExtension(
          tagsToExtend: {"a"},
          builder: (context) {
            final url = context.attributes['href'];

            if (url == null) return const SizedBox();

            if (isYoutube(url)) {
              return FutureBuilder(
                future: getYoutubeTitle(url),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Loading video...");
                  }

                  return GestureDetector(
                    onTap: () => launchUrl(Uri.parse(url)),
                    child: Text(
                      snapshot.data!,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  );
                },
              );
            }

            return GestureDetector(
              onTap: () => launchUrl(Uri.parse(url)),
              child: Text(url, style: const TextStyle(color: Colors.blue)),
            );
          },
        ),
      ],
    );
  }
}
