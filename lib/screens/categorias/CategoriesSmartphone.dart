//Listar apenas a categoria smartphone
import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/widgets/CustomAppBar.dart';
import 'package:ladiescode/widgets/ProductCard.dart';

class SmartphoneCatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Smartphones'),

      //Lista com todos os produtos da categoria
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
                  // Gerar lista com todos os produtos da categoria Smartphones
                  ...List.generate(
                      smartphoneProducts.length,
                      (index) =>
                          ProductCard(product: smartphoneProducts[index]))
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
