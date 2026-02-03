import 'package:pregnant_education/core/constants/app_assets.dart';

enum QrCodeType {
  nasiAyam
}

extension QrCodeTypeExtension on QrCodeType {
  String get stringValue {
    switch (this) {
      case QrCodeType.nasiAyam:
        return 'nasi_ayam';
    }
  }

  static QrCodeType fromString(String value) {
    switch (value) {
      case 'https://q.me-qr.com/2z12sjrd':
        return QrCodeType.nasiAyam;
      default:
        throw ArgumentError('Invalid QrCodeType string: $value');
    }
  }
  
  String getModelPath() {
    switch (this) {
      case QrCodeType.nasiAyam:
        return AppAssets.modelNasiLele;
    }
  }
}