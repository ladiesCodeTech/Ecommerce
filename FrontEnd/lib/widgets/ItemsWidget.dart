// Página home, conteúdo para exibir todos os produtos

import 'package:flutter/material.dart';
import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:ladiescode/screens/item/ItemScreen.dart';
import 'package:ladiescode/widgets/ProductCardWidget.dart';

class ItemsWidget extends StatelessWidget {
  final List<ProdutosModel> produtos;

  const ItemsWidget({Key? key, required this.produtos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        // Gerar lista de todos os produtos
        ...produtos.map(
          (produto) => ProductCard(
            product: produto,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemScreen(produto: produto),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
