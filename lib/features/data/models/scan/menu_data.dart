import 'package:pregnant_education/core/constants/app_assets.dart';

class MenuData {
  // ======= narration ==========
  static String narrationMenu2() {
    return """Sepiring gizi, bekal tumbuh kembang si kecil. Murah, sederhana, tapi dampaknya besar untuk masa depan buah hati""";
  }
  static String narrationMenu3() {
    return """Menu sederhana, manfaat luar biasa untuk janin. Satu piring seimbang, langkah kecil untuk bayi tumbuh sehat maksimal""";
  }
  static String narrationBuburKacangIjo() {
    return """Manis, hangat, penuh gizi. Cukup 1 mangkuk kecil, selingan aman yang manfaatnya besar""";
  }
  static String narrationNagasari() {
    return """Camilan tradisional, manfaat istimewa. Manis alami dari pisang, aman dinikmati selama hamil""";
  }
  // ======= narration ==========
  
  // ======= bahan ==========
  static List<Map> bahanMenu2() {
    return [
      {
        "name": "Nasi",
        "description":
            """1 porsi = 150 gr atau 1 gelas\n\nberfungsi sebagai sumber energi harian yang penting untuk memenuhi kebutuhan kalori ibu hamil. Energi yang cukup membantu mendukung pertumbuhan janin sesuai dengan usia kehamilan.""",
        "capsule_data": [
          {"name": "Energi", "value": "270 kkal"},
          {"name": "Protein", "value": "4,5 gram"},
          {"name": "Lemak", "value": " 0,5 gram"},
          {"name": "Karbohidrat", "value": "59,7 gram"},
        ],
        "icon": AppAssets.iconNasi,
      },
      {
        "name": "Telur bumbu kecap",
        "description":
            """1 porsi = 60 gr atau 1 butir\n\nsumber protein berkualitas tinggi dan kolin. Kolin sangat penting untuk perkembangan otak dan fungsi saraf janin, sehingga berperan dalam pencegahan stunting sejak dini.""",
        "capsule_data": [
          {"name": "Energi", "value": "129,8 kkal"},
          {"name": "Protein", "value": "8,4 gram"},
          {"name": "Lemak", "value": "6,5 gram"},
          {"name": "Karbohidrat", "value": "9,4 gram"},
        ],
        "icon": AppAssets.iconTelur,
      },
      {
        "name": "Tahu Kare",
        "description":
            """1 porsi = 50 gr atau 2 potong sedang\n\nmengandung protein dan kalsium yang berperan dalam pembentukan tulang dan gigi janin. Kandungan rempah pada kare juga membantu meningkatkan nafsu makan dan penyerapan zat gizi.""",
        "capsule_data": [
          {"name": "Energi", "value": "68 kkal"},
          {"name": "Protein", "value": "4,3 gram"},
          {"name": "Lemak", "value": "5,3 gram"},
          {"name": "Karbohidrat", "value": "2,2 gram"},
        ],
        "icon": AppAssets.iconTahu,
      },
      {
        "name": "Sayur Pecel",
        "description":
            """1 porsi = 100 gr atau 1 gelas\n\nterdiri dari berbagai jenis sayuran yang kaya vitamin A, vitamin C, dan asam folat. Saus kacang sebagai pelengkap juga menyumbang protein dan lemak sehat yang mendukung pertumbuhan dan daya tahan tubuh janin.""",
        "capsule_data": [
          {"name": "Energi", "value": "76,8 kkal"},
          {"name": "Protein", "value": "5,4 gram"},
          {"name": "Lemak", "value": "3,6 gram"},
          {"name": "Karbohidrat", "value": "7,6 gram"},
        ],
        "icon": AppAssets.iconSayurPecel,
      },
      {
        "name": "Buah Jeruk",
        "description":
            """1 porsi = 150 gr atau 1 buah\n\nsumber vitamin C yang membantu meningkatkan daya tahan tubuh ibu hamil dan mempercepat penyerapan zat besi dari makanan, sehingga membantu mencegah anemia.""",
        "capsule_data": [
          {"name": "Energi", "value": "206,9 kkal"},
          {"name": "Protein", "value": "16,8 gram"},
          {"name": "Lemak", "value": "3,3 gram"},
          {"name": "Karbohidrat", "value": "38,8 gram"},
        ],
        "icon": AppAssets.iconJeruk,
      },
    ];
  }
  static List<Map> bahanMenu3() {
    return [
      {
        "name": "Nasi",
        "description":
            """1 porsi = 150 gr atau 1 gelas\n\nberfungsi sebagai sumber energi harian yang penting untuk memenuhi kebutuhan kalori ibu hamil. Energi yang cukup membantu mendukung pertumbuhan janin sesuai dengan usia kehamilan.""",
        "capsule_data": [
          {"name": "Energi", "value": "270 kkal"},
          {"name": "Protein", "value": "4,5 gram"},
          {"name": "Lemak", "value": " 0,5 gram"},
          {"name": "Karbohidrat", "value": "59,7 gram"},
        ],
        "icon": AppAssets.iconNasi,
      },
      {
        "name": "Ayam kecap",
        "description":
            """1 porsi = 55 gr atau 1 potong sedang\n\nmengandung protein hewani, zat besi, dan zinc yang berperan penting dalam pertumbuhan tinggi badan dan pembentukan jaringan tubuh janin.""",
        "capsule_data": [
          {"name": "Energi", "value": "122,8 kkal"},
          {"name": "Protein", "value": "10,4 gram"},
          {"name": "Lemak", "value": "6,6 gram"},
          {"name": "Karbohidrat", "value": "5,2 gram"},
        ],
        "icon": AppAssets.iconAyamKecap,
      },
      {
        "name": "Tempe bumbu kuning",
        "description":
            """1 porsi = 50 gr atau 2 potong sedang\n\nmengandung protein nabati serta antioksidan dari kunyit. Kandungan ini membantu proses pertumbuhan sel dan jaringan janin serta menjaga kesehatan ibu hamil.""",
        "capsule_data": [
          {"name": "Energi", "value": "64,8 kkal"},
          {"name": "Protein", "value": "4,8 gram"},
          {"name": "Lemak", "value": "1,9 gram"},
          {"name": "Karbohidrat", "value": "6,3 gram"},
        ],
        "icon": AppAssets.iconTempe,
      },
      {
        "name": "Capcay",
        "description":
            """1 porsi = 100 gr atau 1 gelas\n\nkombinasi berbagai sayuran yang menyediakan vitamin dan mineral penting. Asupan sayuran beragam membantu memenuhi kebutuhan mikronutrien untuk mendukung pertumbuhan janin secara menyeluruh.""",
        "capsule_data": [
          {"name": "Energi", "value": "96,1 kkal"},
          {"name": "Protein", "value": "5,8 gram"},
          {"name": "Lemak", "value": "6,3 gram"},
          {"name": "Karbohidrat", "value": "4,2 gram"},
        ],
        "icon": AppAssets.iconCapcay,
      },
      {
        "name": "Buah Pepaya",
        "description":
            """1 porsi = 110 gr atau 1 potong besar\n\nmengandung vitamin A dan vitamin C yang mendukung sistem imun serta membantu melancarkan pencernaan ibu hamil, sehingga penyerapan zat gizi menjadi lebih optimal.""",
        "capsule_data": [
          {"name": "Energi", "value": "45,9 kkal"},
          {"name": "Protein", "value": "0,5 gram"},
          {"name": "Lemak", "value": "0,1 gram"},
          {"name": "Karbohidrat", "value": "12,2 gram"},
        ],
        "icon": AppAssets.iconPepaya,
      },
    ];
  }
  static List<Map> bahanBuburKacangIjo() {
    return [
      {
        "name": "Bubur Kacang Ijo",
        "description":
            """1 porsi = 240 gr atau 1 mangkok\n\nkaya akan protein, zat besi, dan asam folat yang berperan dalam pembentukan sel darah merah dan pencegahan anemia pada ibu hamil, yang sangat penting untuk pertumbuhan janin.""",
        "icon": AppAssets.iconBuburKacangIjo,
      },
    ];
  }
  static List<Map> bahanNagasari() {
    return [
      {
        "name": "Nagasari",
        "description":
            """1 porsi = 75 gr atau 1 buah\n\nmakanan selingan yang mengandung karbohidrat dan lemak sehat dari santan. Asupan ini membantu memenuhi kebutuhan energi tambahan ibu hamil dan mendukung kecukupan kalori harian.""",
        "icon": AppAssets.iconNagasari,
      },
    ];
  }
  // ======= bahan ==========

  // ======== capsule data ==========
  static List<Map> capsuleDataMenu2() {
    return [
      {"name": "Energi", "value": "751,4 kkal", "percentage": "30"},
      {"name": "Protein", "value": "39,5 gram", "percentage": "30"},
      {"name": "Lemak", "value": "19,2 gram", "percentage": "56"},
      {"name": "Karbohidrat", "value": "117,7 gram", "percentage": "30"},
    ];
  }
  static List<Map> capsuleDataMenu3() {
    return [
      {"name": "Energi", "value": "599,5 kkal", "percentage": "24"},
      {"name": "Protein", "value": "25,9 gram", "percentage": "37"},
      {"name": "Lemak", "value": "15,3 gram", "percentage": "24"},
      {"name": "Karbohidrat", "value": "87,5 gram", "percentage": "23"},
    ];
  }
  static List<Map> capsuleDataBuburKacangIjo() {
    return [
      {"name": "Energi", "value": "259,8 kkal", "percentage": "10"},
      {"name": "Protein", "value": "8,5 gram", "percentage": "12"},
      {"name": "Lemak", "value": "7,3 gram", "percentage": "11"},
      {"name": "Karbohidrat", "value": "42,5 gram", "percentage": "11"},
    ];
  }
  static List<Map> capsuleDataNagasari() {
    return [
      {"name": "Energi", "value": "165,5 kkal", "percentage": "6"},
      {"name": "Protein", "value": "2,2 gram", "percentage": "3"},
      {"name": "Lemak", "value": "3,1 gram", "percentage": "4"},
      {"name": "Karbohidrat", "value": "32,4 gram", "percentage": "8"},
    ];
  }
  // ======== capsule data ==========
}
