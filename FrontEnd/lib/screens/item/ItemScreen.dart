// Página produto, conteúdo da listagem do produto selecionado

import 'package:flutter/material.dart';
import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:ladiescode/models/database/Requisicoes.dart';
import 'package:ladiescode/screens/item/components/CustomItemsBody.dart';
import 'package:ladiescode/screens/item/components/ImageCarosel.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/widgets/CustomAppBar.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key, required this.produto}) : super(key: key);

  final ProdutosModel produto;

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  Api api = Api();
  late ProdutosModel product;

  @override
  void initState() {
    product = widget.produto;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar - barra de navegação superior
      appBar: CustomAppBar(
        title: 'Produto',
      ),

      // Body - página de descrição do produto
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //Imagens do produto
            ImageCarosel(product: widget.produto),
            CustomItemsBody(
              product: widget.produto,
              press: () {},
            ),
          ],
        ),
      )),

      // NavBar - barra de navegação inferior
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
