import 'package:flutter/material.dart';
import '../widgets/app_bottom_navbar.dart';

class ShellLayout extends StatelessWidget {
  final Widget child;
  final String location;

  const ShellLayout({super.key, required this.child, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: AppBottomNavbar(location: location),
      ),
    );
  }
}
