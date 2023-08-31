import 'package:flutter/material.dart';
import 'package:ladiescode/size_config.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {'icon': Icons.tv, 'text': 'SmartTVs', 'route': 'tvCatScreen'},
      {
        'icon': Icons.phone_iphone,
        'text': 'Celulares',
        'route': 'cellphoneCatScreen'
      },
      {
        'icon': Icons.electric_bolt_outlined,
        'text': 'Eletrônicos',
        'route': 'eletronicsCatScreen'
      },
      {'icon': Icons.computer, 'text': 'Computadores', 'route': ''},
    ];

    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < categories.length; i++)
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '${categories[i]['route']}');
                  },
                  child: Container(
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
                              color: Color(0xFFFFDAD9),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                categories[i]['icon'],
                                color: Color(0xFF40000A),
                              ),
                              Padding(padding: EdgeInsets.only(right: 5)),
                              Text(
                                categories[i]['text'],
                                style: TextStyle(
                                    color: Color(0xFF40000A),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
