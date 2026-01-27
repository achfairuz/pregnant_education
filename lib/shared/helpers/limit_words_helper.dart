String limitWords(String text, int wordLimit) {
  final words = text.split(' ');
  if (words.length <= wordLimit) {
    return text;
  }
  return words.sublist(0, wordLimit).join(' ') + '...';
}
