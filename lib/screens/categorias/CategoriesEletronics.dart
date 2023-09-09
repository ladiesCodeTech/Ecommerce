//Listar apenas a categoria Eletroeletronicos
import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/size_config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/widgets/CustomAppBar.dart';
import 'package:ladiescode/widgets/ItemsWidget.dart';
import 'package:ladiescode/widgets/ProductCard.dart';

class EletronicCatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Eletroeletrônicos'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.count(
                childAspectRatio: 0.68,
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  // Gerar lista com todos os produtos da categoria eletroeletrônicos
                  ...List.generate(eletronicProducts.length,
                      (index) => ProductCard(product: eletronicProducts[index]))
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
