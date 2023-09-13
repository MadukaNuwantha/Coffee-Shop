import 'package:coffeeshop/models/coffee_model.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier {
// Coffee for sale
  final List<Coffee> _shop = [
    //   Black coffee
    Coffee(
      name: 'Long Black',
      price: '4.10',
      imagePath: 'assets/black.png',
    ),
    //   Latte
    Coffee(
      name: 'Latte',
      price: '4.20',
      imagePath: 'assets/latte.png',
    ),
    //   Espresso
    Coffee(
      name: 'Espresso',
      price: '3.50',
      imagePath: 'assets/hot-coffee.png',
    ),
    //   Iced coffee
    Coffee(
      name: 'Iced coffee',
      price: '4.40',
      imagePath: 'assets/iced-coffee.png',
    ),
  ];

// User cart
  final List<Coffee> _cart = [];

// Get coffee list
  List<Coffee> get coffeeShop => _shop;

// Get user cart
  List<Coffee> get userCart => _cart;

// Add item to user cart
  void addItemToCart(Coffee coffee) {
    print(coffee.name);
    _cart.add(coffee);
    notifyListeners();
  }

// Remove item from user cart
  void removeItemFromCart(Coffee coffee) {
    _cart.remove(coffee);
    notifyListeners();
  }
}
