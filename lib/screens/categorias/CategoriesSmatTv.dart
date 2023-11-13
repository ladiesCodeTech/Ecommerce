// Listar apenas a categoria SmartTVs

import 'package:flutter/material.dart';
import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:ladiescode/models/database/Requisicoes.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/widgets/CustomAppBar.dart';
import 'package:ladiescode/widgets/ProductCardWidget.dart';

class TvCatScreen extends StatefulWidget {
  @override
  _TvCatScreenState createState() => _TvCatScreenState();
}

class _TvCatScreenState extends State<TvCatScreen> {
  Api api = Api();
  List<ProdutosModel> produtos = [];
  List<ProdutosModel> tvProducts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<ProdutosModel> produtosList = await api.getAllProdutos();
    setState(() {
      produtos = produtosList;
      tvProducts = produtosList
          .where((produto) => produto.category == 'smarttv')
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'SmartTVs'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.count(
                childAspectRatio: 0.68,
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  // Gerar lista com todos os produtos da categoria SmartTVs
                  ...List.generate(
                    tvProducts.length,
                    (index) => ProductCard(
                      product: tvProducts[index],
                      press: () {},
                    ),
                  ),
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
