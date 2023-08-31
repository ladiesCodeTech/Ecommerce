import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ladiescode/models/Product.dart';

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < 6; i++)

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
                  Container(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                            color: demoProducts[i].isFavourite
                                ? Color(0xFFFFEEED) // se true
                                : Color(0xFFF4F4F4), // se false
                            shape: BoxShape.circle),
                        child: Icon(
                          demoProducts[i].isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 20,
                          color: demoProducts[i].isFavourite
                              ? Color(0xFFFF5261) // se true
                              : Color(0xFF201A1A), // se false
                        ),
                      ),
                    ),
                  ),

                  // Imagem
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(demoProducts[i].images),
                  ),

                  // Título
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      demoProducts[i].title,
                      style: TextStyle(fontSize: 12, color: Color(0xFF201A1A)),
                      maxLines: 2,
                    ),
                  ),

                  // Preço
                  Container(
                    padding: EdgeInsets.only(bottom: 3),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'R\$ ${demoProducts[i].price.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF201A1A)),
                    ),
                  ),

                  // Pagamento
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      demoProducts[i].payments,
                      style: TextStyle(fontSize: 10, color: Color(0xFF201A1A)),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    alignment: Alignment.centerLeft,
                    child: RatingBarIndicator(
                      rating: demoProducts[i].rating,
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
