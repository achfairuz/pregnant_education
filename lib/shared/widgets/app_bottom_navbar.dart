import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/app_routes.dart';
import '../../core/themes/app_colors.dart';

class AppBottomNavbar extends StatelessWidget {
  final String location;

  const AppBottomNavbar({super.key, required this.location});

  int _currentIndex() {
    if (location.startsWith(AppRoutes.scan)) return 1;
    if (location.startsWith(AppRoutes.recipes)) return 2;
    if (location.startsWith(AppRoutes.about)) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final index = _currentIndex();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Item(
            icon: Icons.menu_book,
            label: 'Edukasi',
            active: index == 0,
            onTap: () => context.go(AppRoutes.education),
          ),
          _Item(
            icon: Icons.qr_code_scanner,
            label: 'Scan',
            active: index == 1,
            onTap: () => context.go(AppRoutes.scan),
          ),
          _Item(
            icon: Icons.book,
            label: 'Resep',
            active: index == 2,
            onTap: () => context.go(AppRoutes.recipes),
          ),
          _Item(
            icon: Icons.info_outline,
            label: 'Tentang',
            active: index == 3,
            onTap: () => context.push(AppRoutes.about),
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
