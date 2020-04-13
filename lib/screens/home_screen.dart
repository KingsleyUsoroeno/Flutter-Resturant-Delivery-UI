import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/cart_screen.dart';
import 'package:flutter_food_delivery_ui/screens/restaurant_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';

import '../data/data.dart';
import '../models/restaurant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildRating(int rating) {
    return RatingStars(rating: rating);
  }

  _buildResturants() {
    List<Widget> _resturantList = [];
    restaurants.forEach((Restaurant restaurant) {
      _resturantList.add(GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: restaurant))),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey[200])),
          child: Row(
            children: <Widget>[
              Hero(
                tag: restaurant.imageUrl,
                child: ClipRRect(
                  child: Image(
                    image: AssetImage(restaurant.imageUrl),
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        restaurant.name,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.0),
                      _buildRating(restaurant.rating),
                      Text(
                        restaurant.address,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '0.2 Miles away',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    });

    return Column(children: _resturantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Food Delivery'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CartScreen()));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8)),
                hintText: 'Search Food or resturants',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Nearby Resturants',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                  )),
              _buildResturants()
            ],
          )
        ],
      ),
    );
  }
}
