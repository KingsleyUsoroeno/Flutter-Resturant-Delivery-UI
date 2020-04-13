import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';

import '../models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  Widget _buildMenuItem(Food food) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(food.imageUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15.0)),
          ),
          Container(
            width: 175.0,
            height: 175.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black38.withOpacity(0.3),
                    ])),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  food.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
                Text(
                  '\$${food.price}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Theme.of(context).primaryColor),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: Colors.white, size: 20.0),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite,
                          color: Theme.of(context).primaryColor, size: 30.0),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    Text('0.2 Miles away',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600)),
                  ],
                ),
                RatingStars(rating: widget.restaurant.rating),
                Text(widget.restaurant.address,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text('Reviews',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400)),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 14.0),
                    Expanded(
                      child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text('Contact',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.all(20.0),
                crossAxisCount: 2,
                children:
                    List.generate(widget.restaurant.menu.length, (int index) {
                  Food food = widget.restaurant.menu[index];
                  return _buildMenuItem(food);
                })),
          )
        ],
      ),
    );
  }
}
