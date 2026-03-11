import 'package:pregnant_education/core/constants/app_assets.dart';

class MenuData {
  // ======= narration ==========
  static String narrationMenu1() {
    return """Bayangkan sepiring hangat nasi daun jeruk yang harum dan menggugah selera… dipadukan dengan tongkol suwir berbumbu gurih pedas, tempe orek manis legit, tumis kacang panjang yang renyah segar, dan ditutup dengan manis alami dari buah pisang 

Menu ini bukan hanya lezat, tapi juga padat gizi untuk ibu hamil. Dalam satu porsi, terkandung energi sekitar 612,4 kkal atau setara 24% kebutuhan harian ibu hamil.

Semua bahan menggunakan pangan lokal yang mudah ditemukan seperti beras, ikan tongkol, tempe, kacang panjang, dan pisang. Cara pengolahannya pun sederhana dan sehat yaitu ditumis dengan sedikit minyak, menggunakan bumbu alami, tanpa santan berlebih.

""";
  }

  static String narrationMenu2() {
    return """Sedang mencari menu bergizi lengkap untuk ibu hamil yang praktis dan mudah dibuat di rumah? Coba sajian sederhana namun kaya manfaat ini 

Sepiring nasi hangat disandingkan dengan telur bumbu kecap yang gurih manis, tahu kare berbumbu rempah yang lembut, sayur pecel dengan siraman saus kacang yang nikmat, dan segarnya buah jeruk sebagai pelengkap. Kombinasi ini menghadirkan cita rasa tradisional yang akrab di lidah, sekaligus memenuhi kebutuhan gizi penting selama kehamilan.

Dalam satu porsi, menu ini mengandung sekitar 751,4 kkal energi, setara 30% kebutuhan harian ibu hamil. 

Semua bahan mudah ditemukan di pasar atau warung terdekat yaitu beras, telur, tahu, aneka sayuran, kacang tanah, dan jeruk. Cara memasaknya pun sederhana: direbus, ditumis ringan, dan menggunakan bumbu alami tanpa santan berlebihan agar tetap sehat.

""";
  }

  static String narrationMenu3() {
    return """Ingin sajian rumahan yang lezat, seimbang, dan mendukung kesehatan ibu hamil? Menu ini bisa jadi pilihan tepat 

Sepiring nasi hangat dipadukan dengan ayam kecap yang empuk dan meresap bumbunya, tempe bumbu kuning kaya rempah khas Nusantara, capcay berisi aneka sayuran berwarna yang dimasak ringan agar nutrisinya tetap terjaga, serta manis segar buah pepaya sebagai pencuci mulut.

Dalam satu porsi, menu ini mengandung sekitar 599,5 kkal energi atau 24% kebutuhan harian ibu hamil. 

Bahan-bahannya mudah ditemukan di pasar tradisional yaitu beras, ayam, tempe, berbagai sayuran seperti wortel dan kol, serta pepaya matang. Cara pengolahannya pun praktis: ayam dimasak dengan sedikit minyak dan kecap, tempe direbus atau ditumis ringan dengan bumbu kuning, capcay dimasak cepat agar tetap renyah dan bergizi.
""";
  }

  static String narrationBuburKacangIjo() {
    return """Saat perut mulai terasa lapar di sela waktu makan, pilih camilan yang bukan hanya mengenyangkan, tapi juga menyehatkan 

Bubur kacang hijau bisa jadi pilihan tepat untuk ibu hamil. Teksturnya lembut, rasanya hangat dan menenangkan, serta kaya manfaat bagi tubuh. Dalam satu porsi, bubur kacang hijau mengandung sekitar 259,8 kkal energi atau setara 10% kebutuhan harian ibu hamil. 

Bahan-bahannya sederhana dan mudah ditemukan yaitu kacang hijau, santan secukupnya, gula, dan daun pandan untuk aroma alami. Cara membuatnya pun praktis: kacang hijau direndam, direbus hingga empuk, lalu dimasak dengan santan dalam takaran yang tidak berlebihan agar tetap sehat.
""";
  }

  static String narrationNagasari() {
    return """Ingin camilan tradisional yang lembut, manis alami, dan tetap bernilai gizi? Nagasari bisa menjadi pilihan selingan yang tepat untuk ibu hamil 

Kue berbahan dasar tepung beras, santan, dan pisang ini memiliki tekstur lembut dengan aroma khas daun pisang yang menggugah selera. Dalam satu porsi, nagasari mengandung sekitar 165,5 kkal energi atau setara 6% kebutuhan harian ibu hamil.

Bahan-bahannya sangat mudah ditemukan di pasar tradisional yaitu tepung beras, pisang matang, santan secukupnya, dan daun pisang untuk membungkus. Cara pembuatannya pun sederhana: adonan dimasak hingga kental, diberi potongan pisang, lalu dikukus sampai matang tanpa perlu digoreng, sehingga lebih sehat dan rendah minyak.
l""";
  }
  // ======= narration ==========

  // ======= bahan ==========
  static List<Map> bahanMenu1() {
    return [
      {
        "name": "Nasi Daun Jeruk",
        "description":
            """1 porsi = 150 gr atau 1 gelas\n\nSumber karbohidrat yang berfungsi sebagai penyedia energi utama bagi ibu hamil. Energi yang cukup membantu ibu menjalani aktivitas sehari-hari tanpa mudah lelah serta mendukung proses pertumbuhan janin secara optimal sejak dalam kandungan.""",
        "capsule_data": [
          {"name": "Energi", "value": "275 kkal"},
          {"name": "Protein", "value": "4,7 gram"},
          {"name": "Lemak", "value": " 5,3 gram"},
          {"name": "Karbohidrat", "value": "50,7 gram"},
        ],
        "icon": AppAssets.iconNasiDaunJeruk,
      },
      {
        "name": "Tongkol Suwir",
        "description":
            """1 porsi = 40 gr atau 1 potong sedang\n\nMengandung protein hewani, zat besi, dan asam lemak omega-3 yang penting untuk pembentukan jaringan tubuh dan perkembangan otak janin. Kandungan zat besinya membantu mencegah anemia pada ibu hamil, sehingga suplai oksigen ke janin tetap terjaga.""",
        "capsule_data": [
          {"name": "Energi", "value": "80,1 kkal"},
          {"name": "Protein", "value": "8,4 gram"},
          {"name": "Lemak", "value": "4,6 gram"},
          {"name": "Karbohidrat", "value": "1 gram"},
        ],
        "icon": AppAssets.iconTongkol,
      },
      {
        "name": "Tempe Orek",
        "description":
            """1 porsi = 50 gr atau 2 potong sedang\n\nSumber protein nabati yang mudah dicerna serta mengandung kalsium dan zat besi. Konsumsi tempe membantu pembentukan tulang janin dan mendukung peningkatan berat badan janin secara sehat.""",
        "capsule_data": [
          {"name": "Energi", "value": "87,4 kkal"},
          {"name": "Protein", "value": "6,6 gram"},
          {"name": "Lemak", "value": "4,1 gram"},
          {"name": "Karbohidrat", "value": "7,8 gram"},
        ],
        "icon": AppAssets.iconTempe,
      },
      {
        "name": "Tumis Kacang Panjang",
        "description":
            """1 porsi = 100 gr atau 1 gelas\n\nKaya akan asam folat dan serat. Asam folat berperan penting dalam pembentukan sistem saraf dan otak janin, sementara serat membantu menjaga kesehatan pencernaan ibu hamil.""",
        "capsule_data": [
          {"name": "Energi", "value": "50 kkal"},
          {"name": "Protein", "value": "2,5 gram"},
          {"name": "Lemak", "value": "3,5 gram"},
          {"name": "Karbohidrat", "value": "5,5 gram"},
        ],
        "icon": AppAssets.iconKacangPanjang,
      },
      {
        "name": "Buah Pisang",
        "description":
            """1 porsi = 100 gr atau 1 buah\n\nMengandung kalium dan vitamin B6 yang membantu mengurangi keluhan kram otot dan mual selama kehamilan. Kondisi ibu yang sehat dan nyaman akan mendukung penyerapan nutrisi yang lebih baik bagi janin.""",
        "capsule_data": [
          {"name": "Energi", "value": "120 kkal"},
          {"name": "Protein", "value": "1,2 gram"},
          {"name": "Lemak", "value": "0,2 gram"},
          {"name": "Karbohidrat", "value": "31,8 gram"},
        ],
        "icon": AppAssets.iconJeruk,
      },
    ];
  }

  static List<Map> bahanMenu2() {
    return [
      {
        "name": "Nasi",
        "description":
            """1 porsi = 150 gr atau 1 gelas\n\nBerfungsi sebagai sumber energi harian yang penting untuk memenuhi kebutuhan kalori ibu hamil. Energi yang cukup membantu mendukung pertumbuhan janin sesuai dengan usia kehamilan.""",
        "capsule_data": [
          {"name": "Energi", "value": "270 kkal"},
          {"name": "Protein", "value": "4,5 gram"},
          {"name": "Lemak", "value": " 0,5 gram"},
          {"name": "Karbohidrat", "value": "59,7 gram"},
        ],
        "icon": AppAssets.iconNasi,
      },
      {
        "name": "Telur Bumbu Kecap",
        "description":
            """1 porsi = 60 gr atau 1 butir\n\nSumber protein berkualitas tinggi dan kolin. Kolin sangat penting untuk perkembangan otak dan fungsi saraf janin, sehingga berperan dalam pencegahan stunting sejak dini.""",
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
            """1 porsi = 50 gr atau 2 potong sedang\n\nMengandung protein dan kalsium yang berperan dalam pembentukan tulang dan gigi janin. Kandungan rempah pada kare juga membantu meningkatkan nafsu makan dan penyerapan zat gizi.""",
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
            """1 porsi = 100 gr atau 1 gelas\n\nTerdiri dari berbagai jenis sayuran yang kaya vitamin A, vitamin C, dan asam folat. Saus kacang sebagai pelengkap juga menyumbang protein dan lemak sehat yang mendukung pertumbuhan dan daya tahan tubuh janin.""",
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
            """1 porsi = 150 gr atau 1 buah\n\nSumber vitamin C yang membantu meningkatkan daya tahan tubuh ibu hamil dan mempercepat penyerapan zat besi dari makanan, sehingga membantu mencegah anemia.""",
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
            """1 porsi = 150 gr atau 1 gelas\n\nBerfungsi sebagai sumber energi harian yang penting untuk memenuhi kebutuhan kalori ibu hamil. Energi yang cukup membantu mendukung pertumbuhan janin sesuai dengan usia kehamilan.""",
        "capsule_data": [
          {"name": "Energi", "value": "270 kkal"},
          {"name": "Protein", "value": "4,5 gram"},
          {"name": "Lemak", "value": " 0,5 gram"},
          {"name": "Karbohidrat", "value": "59,7 gram"},
        ],
        "icon": AppAssets.iconNasi,
      },
      {
        "name": "Ayam Kecap",
        "description":
            """1 porsi = 55 gr atau 1 potong sedang\n\nMengandung protein hewani, zat besi, dan zinc yang berperan penting dalam pertumbuhan tinggi badan dan pembentukan jaringan tubuh janin.""",
        "capsule_data": [
          {"name": "Energi", "value": "122,8 kkal"},
          {"name": "Protein", "value": "10,4 gram"},
          {"name": "Lemak", "value": "6,6 gram"},
          {"name": "Karbohidrat", "value": "5,2 gram"},
        ],
        "icon": AppAssets.iconAyamKecap,
      },
      {
        "name": "Tempe Bumbu Kuning",
        "description":
            """1 porsi = 50 gr atau 2 potong sedang\n\nMengandung protein nabati serta antioksidan dari kunyit. Kandungan ini membantu proses pertumbuhan sel dan jaringan janin serta menjaga kesehatan ibu hamil.""",
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
            """1 porsi = 100 gr atau 1 gelas\n\nKombinasi berbagai sayuran yang menyediakan vitamin dan mineral penting. Asupan sayuran beragam membantu memenuhi kebutuhan mikronutrien untuk mendukung pertumbuhan janin secara menyeluruh.""",
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
            """1 porsi = 110 gr atau 1 potong besar\n\nMengandung vitamin A dan vitamin C yang mendukung sistem imun serta membantu melancarkan pencernaan ibu hamil, sehingga penyerapan zat gizi menjadi lebih optimal.""",
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
            """1 porsi = 240 gr atau 1 mangkok\n\nKaya akan protein, zat besi, dan asam folat yang berperan dalam pembentukan sel darah merah dan pencegahan anemia pada ibu hamil, yang sangat penting untuk pertumbuhan janin.""",
        "icon": AppAssets.iconBuburKacangIjo,
      },
    ];
  }

  static List<Map> bahanNagasari() {
    return [
      {
        "name": "Nagasari",
        "description":
            """1 porsi = 75 gr atau 1 buah\n\nMakanan selingan yang mengandung karbohidrat dan lemak sehat dari santan. Asupan ini membantu memenuhi kebutuhan energi tambahan ibu hamil dan mendukung kecukupan kalori harian.""",
        "icon": AppAssets.iconNagasari,
      },
    ];
  }
  // ======= bahan ==========

  // ======== capsule data ==========
  static List<Map> capsuleDataMenu1() {
    return [
      {"name": "Energi", "value": "612,4 kkal", "percentage": "24"},
      {"name": "Protein", "value": "23,4 gram", "percentage": "33"},
      {"name": "Lemak", "value": "17,7 gram", "percentage": "20"},
      {"name": "Karbohidrat", "value": "96,8 gram", "percentage": "25"},
    ];
  }

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
