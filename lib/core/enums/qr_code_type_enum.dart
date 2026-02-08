import 'package:pregnant_education/core/constants/app_assets.dart';
import 'package:pregnant_education/features/data/models/scan/menu_data.dart';

enum QrCodeType { nasiAyam, nasiLele, menu2, menu3, nagasari, buburKacangIjo }

extension QrCodeTypeExtension on QrCodeType {
  String get stringValue {
    switch (this) {
      case QrCodeType.nasiAyam:
        return 'nasi_ayam';
      case QrCodeType.nasiLele:
        return 'nasi_lele';
      case QrCodeType.menu2:
        return 'menu_2';
      case QrCodeType.menu3:
        return 'menu_3';
      case QrCodeType.nagasari:
        return 'nagasari';
      case QrCodeType.buburKacangIjo:
        return 'bubur_kacang_ijo';
    }
  }

  static QrCodeType fromString(String value) {
    switch (value) {
      case 'https://q.me-qr.com/2z12sjrd':
        return QrCodeType.nasiAyam;
      case 'nasi_lele':
        return QrCodeType.nasiLele;
      case 'menu_2':
        return QrCodeType.menu2;
      case 'menu_3':
        return QrCodeType.menu3;
      case 'nagasari':
        return QrCodeType.nagasari;
      case 'bubur_kacang_ijo':
        return QrCodeType.buburKacangIjo;
      default:
        throw ArgumentError('Invalid QrCodeType string: $value');
    }
  }

  String getModelPath() {
    switch (this) {
      case QrCodeType.nasiAyam:
        return AppAssets.modelMenu1;
      case QrCodeType.nasiLele:
        return AppAssets.modelNasiLele;
      case QrCodeType.menu2:
        return AppAssets.modelMenu2;
      case QrCodeType.menu3:
        return AppAssets.modelMenu3;
      case QrCodeType.nagasari:
        return AppAssets.modelNagasari;
      case QrCodeType.buburKacangIjo:
        return AppAssets.modelBuburKacangIjo;
    }
  }

  String getNarration() {
    switch (this) {
      case QrCodeType.nasiAyam:
        return "";
      case QrCodeType.nasiLele:
        return "";
      case QrCodeType.menu2:
        return MenuData.narrationMenu2();
      case QrCodeType.menu3:
        return MenuData.narrationMenu3();
      case QrCodeType.nagasari:
        return MenuData.narrationNagasari();
      case QrCodeType.buburKacangIjo:
        return MenuData.narrationBuburKacangIjo();
    }
  }

  List<Map> getCapsuleData() {
    switch (this) {
      case QrCodeType.nasiAyam:
        return [];
      case QrCodeType.nasiLele:
        return [];
      case QrCodeType.menu2:
        return MenuData.capsuleDataMenu2();
      case QrCodeType.menu3:
        return MenuData.capsuleDataMenu3();
      case QrCodeType.nagasari:
        return MenuData.capsuleDataNagasari();
      case QrCodeType.buburKacangIjo:
        return MenuData.capsuleDataBuburKacangIjo();
    }
  }

  List<Map> getBahan() {
    switch (this) {
      case QrCodeType.nasiAyam:
        return [];
      case QrCodeType.nasiLele:
        return [];
      case QrCodeType.menu2:
        return MenuData.bahanMenu2();
      case QrCodeType.menu3:
        return MenuData.bahanMenu3();
      case QrCodeType.nagasari:
        return MenuData.bahanNagasari();
      case QrCodeType.buburKacangIjo:
        return MenuData.bahanBuburKacangIjo();
    }
  }
}
