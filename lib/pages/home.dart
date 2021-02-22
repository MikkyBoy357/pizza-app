import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/models/pizza.dart';
import 'package:mycoolpizzaapp/widgets/size_config.dart';

import '../widgets/item_card.dart';
import 'details_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(MediaQuery.of(context).size.height * 0.00066964285);
    return Scaffold(
      appBar: AppBar(
        title: Text('Instant Pizza'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Column(
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
              Container(
                // color: Colors.red,
                height: 200 * 3.2 + 320,
                width: MediaQuery.of(context).size.width / 1.07,
                child: GridView.builder(
                  itemCount: pizzas.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('pizzas')
                          .snapshots(),
                      // ignore: missing_return
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Center(child: CircularProgressIndicator());
                        return ItemCard(
                          index: index,
                          pizza: pizzas[index],
                          name: snapshot.data.docs[index]['name'],
                          image: snapshot.data.docs[index]['image'],
                          description: snapshot.data.docs[index]['description'],
                          price: snapshot.data.docs[index]['price'],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('pizzas')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData)
                                        return Center(
                                            child: CircularProgressIndicator());
                                      return DetailsScreen(
                                        pizza: pizzas[index],
                                        name: snapshot.data.docs[index]['name'],
                                        image: snapshot.data.docs[index]
                                            ['image'],
                                        description: snapshot.data.docs[index]
                                            ['description'],
                                        price: snapshot.data.docs[index]
                                            ['price'],
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
