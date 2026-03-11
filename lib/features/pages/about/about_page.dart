import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pregnant_education/core/constants/app_assets.dart';
import 'package:pregnant_education/core/themes/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F1),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          "Tentang Penulis",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFffa85c),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// 👩 PROFILE
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFFffa85c), Color(0xFFb2e0b2)],
                ),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(AppAssets.authorPhoto),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "Anisa",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFFffa85c),
              ),
            ),

            const SizedBox(height: 4),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Color(0xFFb2e0b2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Mahasiswa D-IV Gizi Klinik",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 30),

            _cuteCard(
              title: "Tentang Penulis ✨",
              content:
                  "Anisa lahir di Pasuruan pada 18 Desember 2002. Saat ini ia merupakan mahasiswa aktif Program Studi D-IV Gizi Klinik di Politeknik Negeri Jember. Sejak awal perkuliahan, Anisa menunjukkan ketertarikan kuat pada isu pencegahan stunting melalui edukasi gizi berbasis teknologi.",
            ),

            const SizedBox(height: 20),

            _cuteCard(
              title: "Riwayat Pendidikan 🎓",
              content:
                  "• TK Aisyiyah Bustanul Athfal Tambakrejo\n"
                  "• SDN Karangketug 2\n"
                  "• SMPN 7 Pasuruan\n"
                  "• SMAN 1 Kejayan\n"
                  "• D-IV Gizi Klinik Politeknik Negeri Jember (Mahasiswa Aktif)",
            ),

            const SizedBox(height: 20),

            _cuteCard(
              title: "Karya Ilmiah 📚",
              content:
                  "Buku MP-ASI berjudul “Food Recipes Anti Stunting Berbasis Augmented Reality”. Sebuah inovasi yang memadukan ilmu gizi dengan teknologi augmented reality sebagai media pembelajaran interaktif.",
            ),

            const SizedBox(height: 25),

            /// WEBSITE BUTTON
            _buildAppCard(context),
            const SizedBox(height: 14),

            /// E-BOOK BUTTON
            _buildEbookCard(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildAppCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Website Si Cerdas",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Yuk, klik website Si Cerdas untuk mendapatkan edukasi pencegahan stunting sejak dini secara mudah dan interaktif. "
            "Tersedia juga fitur kalkulator status gizi (LILA) untuk membantu memantau status gizi secara cepat dan praktis.",
            style: TextStyle(fontSize: 14, height: 1.6),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () =>
                  _launchURL("https://si-cerdas-production.up.railway.app/#"),
              icon: const Icon(Icons.public, color: AppColors.white),
              label: const Text(
                "Kunjungi Website",
                style: TextStyle(color: AppColors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                elevation: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEbookCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "E-Book Protein Booster",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Yuk, klik E-Book Resep “Protein Booster Cegah Stunting” dan temukan aneka menu tinggi protein berbahan pangan lokal untuk membantu meningkatkan asupan gizi balita stunting.Yuk, klik E-Book Resep “Protein Booster Cegah Stunting” dan temukan aneka menu tinggi protein berbahan pangan lokal untuk membantu meningkatkan asupan gizi balita stunting.",
            style: TextStyle(fontSize: 14, height: 1.6),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: null,
              icon: Icon(Icons.menu_book),
              label: Text("Segera Hadir"),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _cuteCard({required String title, required String content}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFffa85c).withOpacity(0.15),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFFffa85c),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(height: 1.6, color: Colors.black87),
          textAlign: TextAlign.justify,
        ),
      ],
    ),
  );
}
