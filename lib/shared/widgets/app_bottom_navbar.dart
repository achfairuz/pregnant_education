import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import '../../core/routes/app_routes.dart';
import '../../core/themes/app_colors.dart';

class AppBottomNavbar extends StatefulWidget {
  final String location;

  const AppBottomNavbar({super.key, required this.location});

  @override
  State<AppBottomNavbar> createState() => _AppBottomNavbarState();
}

class _AppBottomNavbarState extends State<AppBottomNavbar> {
  final GlobalKey _eduKey = GlobalKey();
  final GlobalKey _scanKey = GlobalKey();
  final GlobalKey _recipeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  bool _tutorialChecked = false;
  int _currentIndex() {
    if (widget.location.startsWith(AppRoutes.scan)) return 1;
    if (widget.location.startsWith(AppRoutes.recipes)) return 2;
    if (widget.location.startsWith(AppRoutes.about)) return 3;
    return 0;
  }

  Future<void> _checkTutorial(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    bool shown = prefs.getBool('navbar_tutorial') ?? false;

    if (!shown) {
      Future.delayed(const Duration(milliseconds: 500), () {
        ShowCaseWidget.of(
          context,
        ).startShowCase([_eduKey, _scanKey, _recipeKey, _aboutKey]);
      });

      await prefs.setBool('navbar_tutorial', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = _currentIndex();
    if (!_tutorialChecked) {
      _tutorialChecked = true;
      _checkTutorial(context);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Showcase(
            key: _eduKey,
            title: "Menu Edukasi",
            description:
                "Berisi informasi edukasi mengenai nutrisi dan kesehatan.",
            titleTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            descTextStyle: const TextStyle(fontSize: 12),
            child: _Item(
              icon: Icons.menu_book,
              label: 'Edukasi',
              active: index == 0,
              onTap: () => context.go(AppRoutes.education),
            ),
          ),

          Showcase(
            key: _scanKey,
            title: "Fitur Scan AR",
            description: "Scan QR Code untuk melihat visualisasi AR makanan.",
            titleTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            descTextStyle: const TextStyle(fontSize: 12),
            child: _Item(
              icon: Icons.qr_code_scanner,
              label: 'Scan',
              active: index == 1,
              onTap: () => context.go(AppRoutes.scan),
            ),
          ),

          Showcase(
            key: _recipeKey,
            title: "Menu Resep",
            description: "Menampilkan resep makanan sehat yang dapat dibuat.",
            titleTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            descTextStyle: const TextStyle(fontSize: 12),
            child: _Item(
              icon: Icons.book,
              label: 'Resep',
              active: index == 2,
              onTap: () => context.go(AppRoutes.recipes),
            ),
          ),

          Showcase(
            key: _aboutKey,
            title: "Tentang Aplikasi",
            description: "Informasi mengenai aplikasi dan pengembang.",
            titleTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            descTextStyle: const TextStyle(fontSize: 12),
            child: _Item(
              icon: Icons.info_outline,
              label: 'Tentang',
              active: index == 3,
              onTap: () => context.push(AppRoutes.about),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _Item({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: active
              ? AppColors.secondary.withOpacity(0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: active ? AppColors.primary : AppColors.secondary),
            if (active) ...[
              const SizedBox(height: 4),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ],
        ),
      ),
    );
  }
}
