//Página home, conteúdo para exibir todos os produtos
import 'package:flutter/material.dart';

import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/widgets/ProductCard.dart';

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        // Gerar lista de todos os produtos
        ...List.generate(
          allProducts.length,
          (index) => ProductCard(
            product: allProducts[index],
          ),
        )
      ],
    );
  }
}
