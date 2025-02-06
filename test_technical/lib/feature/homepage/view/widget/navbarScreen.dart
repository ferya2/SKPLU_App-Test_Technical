import 'package:flutter/material.dart';
import 'package:test_technical/feature/homepage/view/homepage.dart';

import '../../../../core/resources/texstyle.dart';
import 'bottomnavbar.dart';

class NavbarScreen extends StatefulWidget {
  @override
  _NavbarScreenState createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedIndex = 0;

  // List halaman yang akan ditampilkan
  final List<Widget> _pages = [
    HomePage(),
    TransactionPage(),
    MessagePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child:
                Text('Comming soon', style: AppTextStyle.smallTextBlackColor)),
      ),
    );
  }
}

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child:
                Text('Comming soon', style: AppTextStyle.smallTextBlackColor)),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
              child: Text('Comming soon',
                  style: AppTextStyle.smallTextBlackColor))),
    );
  }
}
