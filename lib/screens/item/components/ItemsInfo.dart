import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProductsList.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ladiescode/size_config.dart';

class ItemsInfo extends StatelessWidget {
  const ItemsInfo({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(10)),
      child: Row(
        children: [
          Container(
            height: getProportionateScreenHeight(60),
            width: getProportionateScreenWidth(230),
            child: Text(
              product.title,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            height: getProportionateScreenHeight(60),
            width: getProportionateScreenWidth(110),
            alignment: Alignment.topRight,
            child: RatingBarIndicator(
              rating: product.rating,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Color(0xFFB6082F),
              ),
              itemCount: 5,
              itemSize: 20,
              direction: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
