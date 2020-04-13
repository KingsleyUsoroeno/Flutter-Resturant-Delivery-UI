import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {

  final int rating;

  RatingStars({this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> starWi = [];
    for(int i = 0; i < rating; i++){
      starWi.add(Icon(Icons.star, color: Colors.yellow, size: 20.0,));
    }
    return Row(children: starWi);
  }
}
