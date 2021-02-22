import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/widgets/size_config.dart';

import 'components/cart_card.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return CartCard();
        },
      ),
    );
  }
}
