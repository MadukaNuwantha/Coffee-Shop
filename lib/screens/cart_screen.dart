import 'package:coffeeshop/models/coffee_model.dart';
import 'package:coffeeshop/models/shop_model.dart';
import 'package:coffeeshop/widgets/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Remove item from cart
  void removeItemFromCart(Coffee coffee) {
    Provider.of<Shop>(context, listen: false).removeItemFromCart(coffee);
  }

  // Pay button method
  void paymentMethod() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cart heading
              const Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              //   Display cart item list
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    //   Get individual coffee
                    Coffee eachCoffee = value.userCart[index];
                    //   Display the cart item list
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => removeItemFromCart(eachCoffee),
                      icon: const Icon(Icons.delete),
                    );
                  },
                ),
              ),
              //   Payment button
              GestureDetector(
                onTap: paymentMethod,
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
