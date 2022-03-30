import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/models/pizza.dart';

class PizzaProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Pizza> pizzas = [];

  Future<void> getPizzas() async {
    if (pizzas.isEmpty) {
      print('Getting Pizzas');
      QuerySnapshot snapshot = await firestore.collection('pizzas').get();
      List<DocumentSnapshot> docs = snapshot.docs;

      int length = docs.length;

      pizzas.clear();
      for (int i = 0; i < length; i++) {
        print('loop');
        Pizza tempPizza;

        tempPizza = Pizza.fromJson(docs[i].data() as Map<String, dynamic>);
        print(tempPizza.name);

        pizzas.add(tempPizza);
      }

      print('done');
    } else {
      print('Pizzas have been gotten already');
    }
  }
}
