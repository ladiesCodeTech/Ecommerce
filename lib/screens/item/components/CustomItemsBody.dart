import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/size_config.dart';

class CustomItemsBody extends StatelessWidget {
  const CustomItemsBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15)),
            width: double.infinity,
            color: Colors.white,
            child: SizedBox(
              height: getProportionateScreenHeight(200),
              child: AspectRatio(
                  aspectRatio: 1, child: Image.asset(product.images[0])),
            ),
          ),
        ],
      ),
    );
  }
}
