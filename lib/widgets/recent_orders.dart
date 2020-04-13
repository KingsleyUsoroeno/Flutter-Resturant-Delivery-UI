import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/order.dart';

class RecentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (context, int index) {
                Order order = currentUser.orders[index];
                return _buildRecentOrders(order, context);
              }),
        )
      ],
    );
  }

  Widget _buildRecentOrders(Order order, BuildContext context) {
    return Container(
      width: 320,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 1.0, color: Colors.grey[200])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  child: Image(
                    image: AssetImage(
                      order.food.imageUrl,
                    ),
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            order.food.name,
                            style:
                            TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Expanded(
                          child: Text(
                            order.restaurant.name,
                            style:
                            TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Expanded(
                          child: Text(
                            order.date,
                            style:
                            TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Theme.of(context).primaryColor),
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white,),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
