import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/pages/pizza_view.dart';
import 'package:mycoolpizzaapp/widgets/size_config.dart';

class TrendingItem extends StatefulWidget {
  final String img;
  final String title;
  final String description;
  final String rating;
  final double id;
  final double price;

  TrendingItem({
    Key key,
    @required this.img,
    @required this.title,
    @required this.description,
    @required this.rating,
    this.id,
    this.price,
  }) : super(key: key);

  @override
  _TrendingItemState createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {
  @override
  Widget build(BuildContext context) {
    print(widget.description);
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        // height: MediaQuery.of(context).size.height / 2.5,
        // width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 3.7,
                    width: MediaQuery.of(context).size.width,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PizzaView(
                                img: widget.img,
                                id: widget.id,
                                title: widget.title,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: widget.img,
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width / 3.8,
                            backgroundImage: NetworkImage(
                              '${widget.img}',
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        // child: Hero(
                        //   tag: widget.id,
                        //   child: Image(
                        //     image: AssetImage('${widget.img}'),
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    right: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.yellow[900],
                              size: SizeConfig.textSize(9),
                            ),
                            Text(
                              " ${widget.rating} ",
                              style: TextStyle(
                                fontSize: SizeConfig.textSize(9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    left: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          " OPEN ",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "\$${widget.price}",
                      style: TextStyle(
                        color: Colors.green[700],
                        fontSize: SizeConfig.textSize(24),
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${widget.title}",
                    style: TextStyle(
                      fontSize: SizeConfig.textSize(24),
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.height(2)),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${widget.description}",
                    style: TextStyle(
                      fontSize: SizeConfig.textSize(19),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
