import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/screens/item/components/CustomItemsBody.dart';
import 'package:ladiescode/screens/item/components/ImageCarosel.dart';
import 'package:ladiescode/screens/item/components/ItemsInfo.dart';

// construir o corpo da página de cada produto
class BodyBuilder extends StatelessWidget {
  const BodyBuilder({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          // imagens do produto
          ImageCarosel(product: product),
          // ItemsInfo(product: product,),
          CustomItemsBody(
            product: product,
          ),
        ],
      ),
    ));
  }
}
