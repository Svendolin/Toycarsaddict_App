import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// --- Abschnitt der unteren Button Leiste mit LIST und HOME ---
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        padding: const EdgeInsets.all(16),
        gap: 8,
        tabBorderRadius: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'HOME',
          ),
          GButton(
            icon: Icons.list_alt_rounded,
            text: 'LIST',
          ),
        ],
      ),
    );
  }
}
