import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach(
        (Order order) => totalPrice += order.quantity * order.food.price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart ${currentUser.cart.length}'),
      ),
      body: ListView.separated(
        itemBuilder: (context, int index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildCartItem(context, order);
          }
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Estimated Delivery Time',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600)),
                    Text(
                      '25 Min',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total Cost:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600)),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[700]),
                    )
                  ],
                ),
                SizedBox(height: 85.0)
              ],
            ),
          );
        },
        itemCount: currentUser.cart.length + 1,
        separatorBuilder: (context, int index) {
          return Divider(height: 1, color: Colors.grey);
        },
      ),
      bottomSheet: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(color: Colors.black26, offset: Offset(0, -1)),
          ],
        ),
        child: Center(
            child: FlatButton(
                child: Text(
                  'checkout'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {})),
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, Order order) {
    return Container(
      height: 170.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  width: 170.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(order.food.imageUrl),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(order.food.name,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10.0),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: Colors.black54, width: 0.8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('-',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(width: 20.0),
                              Text(
                                '${order.quantity}',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 20.0),
                              Text('+',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  '\$${order.quantity * order.food.price}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
