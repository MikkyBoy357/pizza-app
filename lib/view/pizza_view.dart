import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PizzaView extends StatelessWidget {
  final String img;
  final double id;
  final String title;

  const PizzaView({
    Key? key,
    required this.img,
    required this.id,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('$title'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hero(
            //   tag: img,
            //   child: Image(
            //     image: AssetImage(img),
            //   ),
            // ),
            Hero(
              tag: img,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width / 2,
                backgroundImage: NetworkImage(img),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
