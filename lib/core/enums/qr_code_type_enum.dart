import 'package:pregnant_education/core/constants/app_assets.dart';

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
        return "Telur ayam rebus atau balap ini protein lengkapnya bantu janin tumbuh cepat, kolin pintar-in otak bayi, zat besi cegah cacat tabung saraf. Bumbu kecap secukupnya ya, jangan kebanyakan garam.";
      case QrCodeType.menu3:
        return "";
      case QrCodeType.nagasari:
        return "";
      case QrCodeType.buburKacangIjo:
        return "";
    }
  }

  List<Map> getCapsuleData() {
    switch (this) {
      case QrCodeType.nasiAyam:
        return [];
      case QrCodeType.nasiLele:
        return [];
      case QrCodeType.menu2:
        return [
          {"name": "Energi", "value": "751,4 kkal", "percentage": "30"},
          {"name": "Lemak", "value": "39,5 gr", "percentage": "56"},
          {"name": "Protein", "value": "19,2 gr", "percentage": "30"},
          {"name": "Karbohidrat", "value": "117,7 gr", "percentage": "30"},
        ];
      case QrCodeType.menu3:
        return [];
      case QrCodeType.nagasari:
        return [];
      case QrCodeType.buburKacangIjo:
        return [];
    }
  }

  List<Map> getBahan() {
    switch (this) {
      case QrCodeType.nasiAyam:
        return [];
      case QrCodeType.nasiLele:
        return [];
      case QrCodeType.menu2:
        return [
          {
            "name": "Nasi",
            "description":
                """1 porsi = 150 gr atau 1 gelas\n\nberfungsi sebagai sumber energi harian yang penting untuk memenuhi kebutuhan kalori ibu hamil. Energi yang cukup membantu mendukung pertumbuhan janin sesuai dengan usia kehamilan.""",
            "capsule_data": [
              {"name": "Energi", "value": "270 kkal"},
              {"name": "Protein", "value": "4,5 gr"},
              {"name": "Lemak", "value": " 0,5 gr"},
              {"name": "Karbohidrat", "value": "59,7 gr"},
            ],
            "icon": AppAssets.iconNasi,
          },
          {
            "name": "Telur bumbu kecap",
            "description":
                """1 porsi = 60 gr atau 1 butir\n\nsumber protein berkualitas tinggi dan kolin. Kolin sangat penting untuk perkembangan otak dan fungsi saraf janin, sehingga berperan dalam pencegahan stunting sejak dini.""",
            "capsule_data": [
              {"name": "Energi", "value": "129,8 kkal"},
              {"name": "Protein", "value": "8,4 gr"},
              {"name": "Lemak", "value": "6,5 gr"},
              {"name": "Karbohidrat", "value": "9,4 gr"},
            ],
            "icon": AppAssets.iconTelur,
          },
          {
            "name": "Tahu Kare",
            "description":
                """1 porsi = 50 gr atau 2 potong sedang\n\nmengandung protein dan kalsium yang berperan dalam pembentukan tulang dan gigi janin. Kandungan rempah pada kare juga membantu meningkatkan nafsu makan dan penyerapan zat gizi.""",
            "capsule_data": [
              {"name": "Energi", "value": "68 kkal"},
              {"name": "Protein", "value": "4,3 gr"},
              {"name": "Lemak", "value": "5,3 gr"},
              {"name": "Karbohidrat", "value": "2,2 gr"},
            ],
            "icon": AppAssets.iconTahu,
          },
          {
            "name": "Sayur Pecel",
            "description":
                """1 porsi = 100 gr atau 1 gelas\n\nterdiri dari berbagai jenis sayuran yang kaya vitamin A, vitamin C, dan asam folat. Saus kacang sebagai pelengkap juga menyumbang protein dan lemak sehat yang mendukung pertumbuhan dan daya tahan tubuh janin.""",
            "capsule_data": [
              {"name": "Energi", "value": "76,8 kkal"},
              {"name": "Protein", "value": "5,4 gr"},
              {"name": "Lemak", "value": "3,6 gr"},
              {"name": "Karbohidrat", "value": "7,6 gr"},
            ],
            "icon": AppAssets.iconSayurPecel,
          },
          {
            "name": "Buah Jeruk",
            "description":
                """1 porsi = 150 gr atau 1 buah\n\nsumber vitamin C yang membantu meningkatkan daya tahan tubuh ibu hamil dan mempercepat penyerapan zat besi dari makanan, sehingga membantu mencegah anemia.""",
            "capsule_data": [
              {"name": "Energi", "value": "206,9 kkal"},
              {"name": "Protein", "value": "16,8 gr"},
              {"name": "Lemak", "value": "3,3 gr"},
              {"name": "Karbohidrat", "value": "38,8 gr"},
            ],
            "icon": AppAssets.iconJeruk,
          },
        ];
      case QrCodeType.menu3:
        return [];
      case QrCodeType.nagasari:
        return [];
      case QrCodeType.buburKacangIjo:
        return [];
    }
  }
}
