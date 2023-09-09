//Listar apenas a categoria smartphone
import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ladiescode/widgets/CustomAppBar.dart';

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
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  for (int i = 0; i < smartphoneProducts.length; i++)

                    //Permite clicks no container
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'itemScreen');
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            //Ícone de favorito
                            Container(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {},
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: smartphoneProducts[i].isFavourite
                                          ? Color(0xFFFFEEED) //true
                                          : Color(0xFFF4F4F4), //false
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    smartphoneProducts[i].isFavourite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 15,
                                    color: smartphoneProducts[i].isFavourite
                                        ? Color(0xFFFF5261) //true
                                        : Color(0xFF201A1A), //false
                                  ),
                                ),
                              ),
                            ),

                            //Imagem do produto
                            SizedBox(
                              width: getProportionateScreenWidth(150),
                              child: AspectRatio(
                                aspectRatio: 1.2,
                                child: Image.asset(
                                    smartphoneProducts[i].images[0]),
                              ),
                            ),

                            //Título do produto
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: getProportionateScreenHeight(5)),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                smartphoneProducts[i].title,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF201A1A)),
                                maxLines: 2,
                              ),
                            ),

                            //Preço do produto
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: getProportionateScreenHeight(3)),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'R\$ ${smartphoneProducts[i].price.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF201A1A)),
                              ),
                            ),

                            //Pagamento do produto
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: getProportionateScreenHeight(5)),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                smartphoneProducts[i].payments,
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xFF201A1A)),
                              ),
                            ),
                            //Ícone estrelinhas
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: getProportionateScreenHeight(5)),
                              alignment: Alignment.centerLeft,
                              child: RatingBarIndicator(
                                rating: smartphoneProducts[i].rating,
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
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
