import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ladiescode/models/products_list.dart';
import 'package:ladiescode/size_config.dart';

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < allProducts.length; i++)

          // Fazer o container todo ser clicavel
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'itemScreen');
            },
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  // ícone de favorito
                  Container(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      // criar mudança de estado ao clicar, add ou remover de favoritos
                      onTap: () {},
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: allProducts[i].isFavourite
                                ? Color(0xFFFFEEED) // se true
                                : Color(0xFFF4F4F4), // se false
                            shape: BoxShape.circle),
                        child: Icon(
                          allProducts[i].isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 15,
                          color: allProducts[i].isFavourite
                              ? Color(0xFFFF5261) // se true
                              : Color(0xFF201A1A), // se false
                        ),
                      ),
                    ),
                  ),

                  // Imagem do produto
                  SizedBox(
                    width: getProportionateScreenWidth(150),
                    child: AspectRatio(
                      aspectRatio: 1.2,
                      child: Image.asset(allProducts[i].images),
                    ),
                  ),

                  // Título
                  Container(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(5)),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      allProducts[i].title,
                      style: TextStyle(fontSize: 12, color: Color(0xFF201A1A)),
                      maxLines: 2,
                    ),
                  ),

                  // Preço
                  Container(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(3)),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'R\$ ${allProducts[i].price.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF201A1A)),
                    ),
                  ),

                  // Pagamento
                  Container(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(5)),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      allProducts[i].payments,
                      style: TextStyle(fontSize: 10, color: Color(0xFF201A1A)),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(5)),
                    alignment: Alignment.centerLeft,
                    child: RatingBarIndicator(
                      rating: allProducts[i].rating,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Color(0xFFB6082F),
                      ),
                      itemCount: 5,
                      itemSize: 12,
                      direction: Axis.horizontal,
                    ),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}
