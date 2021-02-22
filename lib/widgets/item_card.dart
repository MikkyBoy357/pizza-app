import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/models/pizza.dart';
import 'package:mycoolpizzaapp/widgets/size_config.dart';

class ItemCard extends StatelessWidget {
  final Pizza pizza;
  final int index;
  final Function onPressed;
  // fields
  final String name;
  final String image;
  final String description;
  final double price;
  const ItemCard({
    this.onPressed,
    this.pizza,
    this.index,
    this.name,
    this.image,
    this.description,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: SizeConfig.width(200),
        height: SizeConfig.height(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                height: SizeConfig.width(182) - 12,
                                width: 179,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  // border: Border.all(),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tomato Pizza',
                                            style: TextStyle(
                                              fontSize: SizeConfig.textSize(17),
                                            ),
                                          ),
                                          Text(
                                            'Pizza with tomatoes',
                                            style: TextStyle(
                                              fontSize: SizeConfig.textSize(14),
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  SizeConfig.textSize(17.5),
                                            ),
                                          ),
                                          Text(
                                            description,
                                            style: TextStyle(
                                              fontSize:
                                                  SizeConfig.textSize(14.5),
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\$${price.toString()}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  print('add to cart');
                                                },
                                                child: Container(
                                                  height: SizeConfig.width(47),
                                                  width: SizeConfig.width(47),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(16),
                                                      bottomRight:
                                                          Radius.circular(16),
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 42,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Hero(
                      tag: pizza.image,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width / 4.6,
                        backgroundImage: NetworkImage(image),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
