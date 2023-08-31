import 'package:flutter/material.dart';

import 'package:ladiescode/screens/home/components/CategoriesWidget.dart';
import 'package:ladiescode/widgets/ItemsWidget.dart';

import 'package:ladiescode/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(20)),

        // título categorias
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
          child: Text(
            'Categorias',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(height: getProportionateScreenHeight(10)),

        // chamar as categorias de produtos
        CategoriesWidget(),

        SizedBox(height: getProportionateScreenHeight(20)),

        // título "todos os ítens"
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
          child: Text(
            'Todos os produtos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // chamar a lista de ítens
        ItemsWidget(),
      ],
    )));
  }
}
