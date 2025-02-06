import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/resources/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GNav(
          rippleColor: Colors.blueAccent, // Warna efek ripple saat ditekan
          hoverColor: AppColor.blackNeutral, // Warna hover
          haptic: true, // Efek getaran saat tab ditekan
          tabBorderRadius: 15,
          tabActiveBorder: Border.all(color: Colors.black, width: 1),
          curve: Curves.bounceIn,
          duration: const Duration(milliseconds: 400),
          gap: 8,
          color: AppColor.secondaryColor, // Warna ikon saat tidak dipilih
          activeColor: Colors.black, // Warna ikon & teks saat dipilih
          iconSize: 24,
          tabBackgroundColor: Colors.white, // Warna latar belakang tab terpilih
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          selectedIndex: selectedIndex,
          onTabChange: onTabChange,
          tabs: const [
            GButton(
              icon: Icons.home_outlined, // Ikon transaction
              text: 'Home',
            ),
            GButton(
              icon: Icons.history_outlined, // Ikon message
              text: 'History',
            ),
            GButton(
              icon: Icons.message_outlined, // Ikon settings
              text: 'Message', // Page keempat
            ),
            GButton(
              icon: Icons.person, // Ikon profile
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
