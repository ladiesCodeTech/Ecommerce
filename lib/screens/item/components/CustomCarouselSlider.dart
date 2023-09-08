import 'package:flutter/material.dart';
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
              'images/smartTvs/1.png',
              height: getProportionateScreenHeight(200),
              fit: BoxFit.contain,
            ),
            Row()
          ],
        ));
  }
}

// 'images/smartTvs/1.png'
// 'images/cellphones/1.webp',
