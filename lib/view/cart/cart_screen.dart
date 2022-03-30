import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/providers/cart_provider.dart';
import 'package:mycoolpizzaapp/widgets/size_config.dart';
import 'package:provider/provider.dart';

import 'components/cart_card.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<CartProvider>(context, listen: false).getCartItems();

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, _) {
          if (cartProvider.cartItems.isEmpty) {
            return Center(
              child: Text(cartProvider.cartItems.toString()),
            );
          } else {
            return ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                return CartCard(
                  cartItem: cartProvider.cartItems[index],
                  press: () {},
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    );
  }
}
