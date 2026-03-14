import 'package:flutter_tts/flutter_tts.dart';

class TtsHelper {
  TtsHelper._();

  static final FlutterTts _tts = FlutterTts();
  static bool _isInitialized = false;

  static Future<void> init({
    String? language,
    double? pitch,
    double? rate,
    double? volume,
  }) async {
    if (_isInitialized) {
      await _applySettings(
        language: language,
        pitch: pitch,
        rate: rate,
        volume: volume,
      );
      return;
    }

    final lg = await _tts.getLanguages;

    print("languages: $lg");

    await _tts.awaitSpeakCompletion(true);
    await _applySettings(
      language: language,
      pitch: pitch,
      rate: rate,
      volume: volume,
    );
    _isInitialized = true;
  }

  static Future<void> _applySettings({
    String? language,
    double? pitch,
    double? rate,
    double? volume,
  }) async {
    if (language != null) {
      await _tts.setLanguage(language);
    }
    if (pitch != null) {
      await _tts.setPitch(pitch);
    }
    if (rate != null) {
      await _tts.setSpeechRate(rate);
    }
    if (volume != null) {
      await _tts.setVolume(volume);
    }
  }

  static Future<void> setLanguage(String language) =>
      _tts.setLanguage(language);

  static Future<void> setPitch(double pitch) => _tts.setPitch(pitch);

  static Future<void> setRate(double rate) => _tts.setSpeechRate(rate);

  static Future<void> setVolume(double volume) => _tts.setVolume(volume);

  static Future<List<dynamic>> getLanguages() async {
    final result = await _tts.getLanguages;
    return (result is List<dynamic>) ? result : <dynamic>[];
  }

  static Future<List<dynamic>> getVoices() async {
    final result = await _tts.getVoices;
    return (result is List<dynamic>) ? result : <dynamic>[];
  }

  static Future<void> setVoice(Map<String, String> voice) =>
      _tts.setVoice(voice);

  static Future<void> speak(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      return;
    }

    // hentikan narasi sebelumnya
    await _tts.stop();

    // jalankan narasi baru
    await _tts.speak(trimmed);
  }

  static Future<void> stop() => _tts.stop();

  static Future<void> pause() => _tts.pause();

  static Future<void> dispose() async {
    await _tts.stop();
  }
}
