import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/models/cart_item.dart';
import 'package:mycoolpizzaapp/models/pizza.dart';
import 'package:mycoolpizzaapp/utils/const.dart';
import 'package:mycoolpizzaapp/utils/enums.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> cartItems = [];

  Future<void> getCartItems() async {
    if (cartItems.isEmpty) {
      print('==========> CartLoop');
      print('Items ===> ${Const.cartBox.length}');

      for (int i = 0; i < Const.cartBox.length; i++) {
        print('CartItem ===> ${Const.cartBox.getAt(i)}');

        // Map<String, dynamic> temp = Const.cartBox.getAt(i);

        Map<String, dynamic> temp =
            new Map<String, dynamic>.from(Const.cartBox.getAt(i));

        CartItem tempCartItem;

        tempCartItem = CartItem.fromJson(temp);
        //
        cartItems.add(tempCartItem);
      }

      // notifyListeners();

      print('===> All Cart Items <===\n $cartItems');
    } else {
      print('==========> No CartLoop');
    }
    // notifyListeners();
  }

  void addPizzaToCart(Pizza pizza, {String? size = 'Medium', int? quantity}) {
    Map<String, dynamic> itemBody = pizza.toJson();

    itemBody['size'] = size ?? 'Medium';

    // Merge new cart item with similar items in db
    if (Const.cartBox.get(pizza.pizzaId) != null &&
        Const.cartBox.get(pizza.pizzaId)['size'] == size) {
      itemBody['quantity'] =
          Const.cartBox.get(pizza.pizzaId)['quantity'] + (quantity ?? 1);
    } else {
      itemBody['quantity'] = quantity ?? 1;
    }

    // if (itemBody['quantity'] == null) {
    //   itemBody['quantity'] = quantity ?? 1;
    // } else if (){
    //   print('======> exists');
    //
    // }

    Const.cartBox.put(pizza.pizzaId, itemBody);

    print('===> Pizza Added to cart <===\n $itemBody \n ${pizza.pizzaId}\n');
  }
}
