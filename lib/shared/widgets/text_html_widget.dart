import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pregnant_education/core/themes/app_sizes.dart';

class TextHtmlWidget extends StatefulWidget {
  final String htmlData;
  const TextHtmlWidget({super.key, required this.htmlData});

  @override
  State<TextHtmlWidget> createState() => _TextHtmlWidgetState();
}

class _TextHtmlWidgetState extends State<TextHtmlWidget> {
  @override
  Widget build(BuildContext context) {
    return Html(
      data: widget.htmlData,
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
      },
    );
  }
}
