import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/size_config.dart';

class CustomItemsBody extends StatelessWidget {
  const CustomItemsBody({
    super.key,
    required this.product,
  });

  final Product product;

  void openDescriptionModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Descrição do produto"),
          content: Text("Here goes the description of the product."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void openRatingModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Avaliação do produto"),
          content: Text("Here goes the rating section."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(
          right: getProportionateScreenWidth(15),
          left: getProportionateScreenWidth(15),
          top: getProportionateScreenHeight(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Título do produto
              SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.07,
                child: Text(
                  product.title,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),

              // Nota da avaliação
              Container(
                height: screenHeight * 0.07,
                alignment: Alignment.topRight,
                child: RatingBarIndicator(
                  rating: product.rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Color(0xFFB6082F),
                  ),
                  itemCount: 5,
                  itemSize: 20,
                  direction: Axis.horizontal,
                ),
              ),
            ],
          ),

          // Preço do produto
          Container(
            margin: EdgeInsets.only(top: getProportionateScreenHeight(8)),
            width: double.infinity,
            child: Text(
              'R\$ ${product.price.toStringAsFixed(2)}',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Métodos de pagamento
          Container(
              margin: EdgeInsets.only(
                  top: getProportionateScreenHeight(8),
                  bottom: getProportionateScreenHeight(15)),
              width: double.infinity,
              child: Text(
                product.payments,
                style: TextStyle(fontSize: 14),
              )),

          TextButton.icon(
              onPressed: () {},
              icon: Icon(CupertinoIcons.cart),
              label: Text(
                'Adicionar ao carrinho',
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB6082F),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                  fixedSize:
                      Size(screenWidth, getProportionateScreenHeight(53)))),

          SizedBox(
            height: getProportionateScreenHeight(10),
          ),

          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              height: getProportionateScreenHeight(53),
              width: screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Avaliação do produto',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFB6082F),
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: getProportionateScreenHeight(20)),
            width: double.infinity,
            child: Text(
              'Recomendados',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                // children: ...List.generate(length, (index) => null),
                ),
          )
        ],
      ),
    );
  }
}

// SizedBox(height: getProportionateScreenHeight(8)),
//           Text(
//             'product.price',
//             style: TextStyle(
//               fontSize: 18,
//             ),
//           ),
//           Text(
//             product.payments,
//             style: TextStyle(
//               fontSize: 14,
//             ),
//           ),
//           SizedBox(height: 16),
//           SizedBox(
//             width: 335,
//             height: 53,
//             child: ElevatedButton.icon(
//               onPressed: () {
//                 // Perform "Adicionar ao carrinho" action here
//               },
//               icon: Icon(Icons.shopping_cart),
//               label: Text(
//                 'Adicionar ao carrinho',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: Color(0xFFB7082F),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//           SizedBox(
//             width: 335,
//             height: 53,
//             child: ElevatedButton(
//               onPressed: () {
//                 openDescriptionModal(context);
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Descrição do produto',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Color.fromARGB(255, 88, 88, 88),
//                     ),
//                   ),
//                   Icon(
//                     Icons.chevron_right,
//                     color: Color(0xFFB7082F),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//           SizedBox(
//             width: 335,
//             height: 53,
//             child: ElevatedButton(
//               onPressed: () {
//                 openRatingModal(context);
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Avaliação do produto',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Color.fromARGB(255, 88, 88, 88),
//                     ),
//                   ),
//                   Icon(
//                     Icons.chevron_right,
//                     color: Color(0xFFB7082F),
//                   ),
//                 ],
//               ),
//             ),
//           ),