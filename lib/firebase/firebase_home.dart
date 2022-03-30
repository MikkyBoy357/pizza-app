import 'package:flutter/material.dart';

// Firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycoolpizzaapp/models/pizza.dart';

class FirebaseHome extends StatefulWidget {
  @override
  _FirebaseHomeState createState() => _FirebaseHomeState();
}

class _FirebaseHomeState extends State<FirebaseHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Home'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('pizzas').snapshots(),
        // ignore: missing_return
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Text('Loading data... Please Wait...');
          return Column(
            children: [
              Text(snapshot.data.docs[0]['name']),
              Text(snapshot.data.docs[0]['description']),
              Text(snapshot.data.docs[0]['image']),
              Text(snapshot.data.docs[0]['price'].toString()),
            ],
          );
        },
      ),
    );
  }
}
