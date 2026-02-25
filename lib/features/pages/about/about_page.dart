import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pregnant_education/core/constants/app_assets.dart';
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
              "Anisa 🌸",
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
                "Mahasiswa D-IV Gizi Klinik 🥦",
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
                  "• D-IV Gizi Klinik, Politeknik Negeri Jember (Mahasiswa Aktif)",
            ),

            const SizedBox(height: 20),

            _cuteCard(
              title: "Karya Ilmiah 📚",
              content:
                  "Buku MP-ASI berjudul “Food Recipes Anti Stunting Berbasis Augmented Reality”. Sebuah inovasi yang memadukan ilmu gizi dengan teknologi augmented reality sebagai media pembelajaran interaktif.",
            ),

            const SizedBox(height: 25),

            /// WEBSITE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    _launchURL("https://si-cerdas-production.up.railway.app/"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFffa85c),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "🌍 Kunjungi Website Si Cerdas",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: Color(0xFFb2e0b2)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  "📘 E-Book Protein Booster (Segera Hadir)",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
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
          ),
        ],
      ),
    );
  }
}
