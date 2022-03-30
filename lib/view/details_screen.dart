import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/models/pizza.dart';
import 'package:mycoolpizzaapp/providers/cart_provider.dart';
import 'package:mycoolpizzaapp/widgets/BuildOutlineButton.dart';
import 'package:mycoolpizzaapp/widgets/CustomButton.dart';
import 'package:mycoolpizzaapp/widgets/pizza_size_button.dart';
import 'package:mycoolpizzaapp/widgets/size_config.dart';
import 'package:mycoolpizzaapp/widgets/trending_item.dart';
import 'package:provider/provider.dart';

import 'cart/cart_screen.dart';

class DetailsScreen extends StatefulWidget {
  final Pizza pizza;
  // fields
  // final String name;
  // final String image;
  // final String description;
  // final double price;

  const DetailsScreen({
    Key? key,
    required this.pizza,
    // required this.name,
    // required this.image,
    // required this.description,
    // required this.price,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int numOfItems = 1;
  String pizzaSize = 'Medium';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 20.0, right: 30.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Instant',
                              style: TextStyle(
                                fontSize: SizeConfig.textSize(39),
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Pizza',
                              style: TextStyle(
                                fontSize: SizeConfig.textSize(29),
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 1,
                      indent: 25,
                      endIndent: 20,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Details',
                              style: TextStyle(
                                fontSize: SizeConfig.textSize(39),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Buy',
                              style: TextStyle(
                                fontSize: SizeConfig.textSize(24),
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              indent: 40,
              endIndent: 40,
            ),
            Container(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TrendingItem(
                img: '${widget.pizza.image}',
                title: '${widget.pizza.name}',
                description: '${widget.pizza.description}',
                rating: widget.pizza.rating,
                id: widget.pizza.price!,
                price: widget.pizza.price!,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Text(
            //     'TOMATO PIZZA',
            //     style: TextStyle(
            //       fontSize: 35,
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),
            Center(
              child: Container(
                // height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width - 20,
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BuildOutlineButton(
                            icon: Icons.remove,
                            onPressed: () {
                              if (numOfItems > 1) {
                                setState(() {
                                  numOfItems--;
                                });
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              // if our item is less  then 10 then  it shows 01 02 like that
                              numOfItems.toString().padLeft(1, "$numOfItems"),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          BuildOutlineButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  numOfItems++;
                                });
                              }),
                        ],
                      ),
                      SizedBox(height: 7.5),
                      Divider(thickness: 1),
                      SizedBox(height: 7.5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PizzaSizeButton(
                            label: 'S',
                            selected: pizzaSize == 'Small',
                            onTap: () {
                              setState(() {
                                pizzaSize = 'Small';
                              });
                            },
                          ),
                          PizzaSizeButton(
                            label: 'M',
                            selected: pizzaSize == 'Medium',
                            onTap: () {
                              setState(() {
                                pizzaSize = 'Medium';
                              });
                            },
                          ),
                          PizzaSizeButton(
                            label: 'L',
                            selected: pizzaSize == 'Large',
                            onTap: () {
                              setState(() {
                                pizzaSize = 'Large';
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 7.5),
                      Divider(thickness: 1),
                      SizedBox(height: 7.5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .addPizzaToCart(
                                  widget.pizza,
                                  size: pizzaSize,
                                  quantity: numOfItems,
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Center(
                                  child: Icon(
                                    Icons.add_shopping_cart_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            CustomButton(
                              colour: Colors.green,
                              text: 'Buy Now',
                              icon: Icons.shopping_cart_outlined,
                              onPressed: () {
                                print('Buy Now!');
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.red,
    // elevation: 0,
    title: Text('Details'),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          CupertinoIcons.search,
          size: 30,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(
          Icons.shopping_cart_outlined,
          size: 30,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartScreen();
              },
            ),
          );
        },
      ),
      SizedBox(width: 10),
    ],
  );
}
