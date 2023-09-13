import 'package:coffeeshop/models/coffee_model.dart';
import 'package:coffeeshop/models/shop_model.dart';
import 'package:coffeeshop/screens/select_item_screen.dart';
import 'package:coffeeshop/widgets/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading message
              const Text(
                'How would you like your coffee?',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 25.0),
              //   List of coffees
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    //   Get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];

                    //   Display the coffee list
                    return CoffeeTile(
                      icon: const Icon(Icons.add),
                      coffee: eachCoffee,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SelectItemScreen(coffee: eachCoffee),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
