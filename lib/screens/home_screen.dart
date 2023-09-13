import 'package:coffeeshop/screens/cart_screen.dart';
import 'package:coffeeshop/screens/shop_screen.dart';
import 'package:coffeeshop/widgets/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Bottom navigation bar redirection
  int _selectedIndex = 0;
  redirectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Screen list
  final List<Widget> _screens = [
    //   Shop screen
    const ShopScreen(),
    //   Cart screen
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(
        onTabChange: (index) => redirectScreen(index),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
