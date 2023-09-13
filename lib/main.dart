import 'package:coffeeshop/models/shop_model.dart';
import 'package:coffeeshop/screens/splash_screen.dart';
import 'package:coffeeshop/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const CoffeeShop(),
  );
}

class CoffeeShop extends StatelessWidget {
  const CoffeeShop({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Shop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee Shop',
        theme: lightMode,
        home: const SplashScreen(),
      ),
    );
  }
}
