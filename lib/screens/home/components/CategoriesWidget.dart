import 'package:flutter/material.dart';
import 'package:ladiescode/size_config.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {'icon': Icons.tv, 'text': 'SmartTVs'},
      {'icon': Icons.phone_iphone, 'text': 'Celulares'},
      {'icon': Icons.electric_bolt_outlined, 'text': 'Eletrônicos'},
      {'icon': Icons.computer, 'text': 'Computadores'},
    ];

    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < categories.length; i++)
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(3)),
                // width: getProportionateScreenWidth(110),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15),
                          vertical: getProportionateScreenHeight(5)),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(categories[i]['icon']),
                          Padding(padding: EdgeInsets.only(right: 5)),
                          Text(categories[i]['text']),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
