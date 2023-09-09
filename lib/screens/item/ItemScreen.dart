//Página listagem de produto selecionado
import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/screens/item/components/CustomItemsBody.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/widgets/CustomAppBar.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // Appbar - barra de navegação superior
      appBar: CustomAppBar(
        title: '',
      ),

      // Body - página de descrição do produto
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15)),
              width: double.infinity,
              color: Colors.white,
              child: SizedBox(
                height: getProportionateScreenHeight(200),
                child: AspectRatio(
                    aspectRatio: 1, child: Image.asset(product.images[0])),
              ),
            ),
          ],
        ),
      ),

      // NavBar - barra de navegação inferior
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

// class ProductDetailsArguments {
//   final Product product;

//   ProductDetailsArguments({required this.product});
// }
