import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/models/pizza.dart';
import 'package:mycoolpizzaapp/providers/pizza_provider.dart';
import 'package:mycoolpizzaapp/widgets/size_config.dart';
import 'package:provider/provider.dart';

import '../widgets/item_card.dart';
import 'details_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Instant Pizza'),
        backgroundColor: Colors.red,
      ),
      body: Consumer<PizzaProvider>(
        builder: (context, pizzaProvider, _) {
          return FutureBuilder(
            future: pizzaProvider.getPizzas(),
            builder: (context, AsyncSnapshot snapshot) {
              return SingleChildScrollView(
                child: Column(
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
                              width: SizeConfig.width(1),
                              indent: SizeConfig.width(25),
                              endIndent: SizeConfig.width(20),
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Browse',
                                      style: TextStyle(
                                        fontSize: SizeConfig.textSize(39),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Now',
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
                      indent: SizeConfig.width(38),
                      endIndent: SizeConfig.width(38),
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: pizzaProvider.pizzas.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (context, index) {
                          Pizza pizza = pizzaProvider.pizzas[index];

                          if (pizzaProvider.pizzas.isEmpty) {
                            return Center(
                              child: Text('Getting Pizzas'),
                            );
                          } else {
                            return ItemCard(
                              // index: index,
                              pizza: pizza,
                              // name: pizza.name!,
                              // image: pizza.image!,
                              // description: pizza.description!,
                              // price: pizza.price!,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DetailsScreen(
                                        pizza: pizza,
                                        // name: pizza.name!,
                                        // image: pizza.image!,
                                        // description: pizza.description!,
                                        // price: pizza.price!,
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
