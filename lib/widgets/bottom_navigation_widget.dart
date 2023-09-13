import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationWidget extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavigationWidget({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey.shade400,
        activeColor: Colors.grey.shade700,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
