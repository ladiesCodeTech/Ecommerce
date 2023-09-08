import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/size_config.dart';

class CustomCarouselSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
        child: Column(
          children: [
            Image.asset(
              allProducts[0].images[0],
              height: getProportionateScreenHeight(200),
              fit: BoxFit.contain,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(allProducts[0].images.length, (index) => dotBuilder()),
            )
          ],
        ));
  }

  Container dotBuilder() {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(5)),
    );
  }
}

// 'images/smartTvs/1.png'
// 'images/cellphones/1.webp',
