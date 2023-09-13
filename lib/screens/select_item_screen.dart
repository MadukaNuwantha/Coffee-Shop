import 'package:coffeeshop/models/coffee_model.dart';
import 'package:coffeeshop/models/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectItemScreen extends StatefulWidget {
  final Coffee coffee;
  const SelectItemScreen({super.key, required this.coffee});

  @override
  State<SelectItemScreen> createState() => _SelectItemScreenState();
}

class _SelectItemScreenState extends State<SelectItemScreen> {
  // Number of coffees
  int coffeeAmt = 1;
  // Coffee sizes
  bool isSmall = true;
  bool isMedium = false;
  bool isLarge = false;

  // Coffee size selector
  void selectSize(String size) {
    setState(() {
      if (size == 'small') {
        isSmall = !isSmall;
        isMedium = false;
        isLarge = false;
      } else if (size == 'medium') {
        isMedium = !isMedium;
        isSmall = false;
        isLarge = false;
      } else if (size == 'large') {
        isLarge = !isLarge;
        isSmall = false;
        isMedium = false;
      }
    });
  }

  // Add item to cart method
  void addToCart(Coffee coffee) {
    // Add item to cart
    Provider.of<Shop>(context, listen: false).addItemToCart(coffee);
    //   Redirecting to shop screen
    Navigator.pop(context);
    //   Successful message
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor:
            Colors.transparent, // Set background color to transparent
        elevation: 0, // Remove the shadow
        content: Container(
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(12), // Set the border radius
          ),
          child: const Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Successfully added to cart',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                // Add other content here if needed
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.brown,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      widget.coffee.imagePath,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'QUANTITY',
                    style: TextStyle(
                      color: Colors.brown,
                      letterSpacing: 5,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            coffeeAmt != 1 ? coffeeAmt-- : null;
                          });
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.brown,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            coffeeAmt.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            coffeeAmt++;
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.brown,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'SIZE',
                    style: TextStyle(
                      color: Colors.brown,
                      letterSpacing: 5,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          selectSize('small');
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(18.0),
                          decoration: BoxDecoration(
                            color:
                                isSmall ? Colors.brown : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              'S',
                              style: TextStyle(
                                color: isSmall
                                    ? Colors.white
                                    : Colors.grey.shade500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          selectSize('medium');
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(18.0),
                          decoration: BoxDecoration(
                            color:
                                isMedium ? Colors.brown : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              'M',
                              style: TextStyle(
                                color: isMedium
                                    ? Colors.white
                                    : Colors.grey.shade500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          selectSize('large');
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(18.0),
                          decoration: BoxDecoration(
                            color:
                                isLarge ? Colors.brown : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              'L',
                              style: TextStyle(
                                color: isLarge
                                    ? Colors.white
                                    : Colors.grey.shade500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      addToCart(widget.coffee);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(25.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
