import 'package:flutter/material.dart';
import 'package:ladiescode/screens/item/components/CustomItemsBody.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/widgets/CustomAppBar.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // Appbar - barra de navegação superior
      appBar: CustomAppBar(),

      // Body - página de descrição do produto
      body: CustomItemsBody(
        title: 'Product Title',
        description: 'Product Description',
      ),

      // NavBar - barra de navegação inferior
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}