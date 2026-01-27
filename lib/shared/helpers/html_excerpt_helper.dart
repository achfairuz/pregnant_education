import 'package:html/parser.dart' as html_parser;

String extractParagraphText(String html, {int maxWords = 20}) {
  final document = html_parser.parse(html);

  // Ambil semua <p>
  final paragraphs = document.getElementsByTagName('p');

  if (paragraphs.isEmpty) return '';

  // Gabungkan semua <p>
  final text = paragraphs
      .map((p) => p.text.trim())
      .where((text) => text.isNotEmpty)
      .join(' ');

  // Batasi jumlah kata
  final words = text.split(RegExp(r'\s+'));
  if (words.length <= maxWords) return text;

  return words.take(maxWords).join(' ') + '...';
}
