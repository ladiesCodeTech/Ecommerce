// Listar apenas a categoria

import 'package:flutter/material.dart';
import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:ladiescode/models/database/Requisicoes.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/widgets/CustomAppBar.dart';
import 'package:ladiescode/widgets/ProductCardWidget.dart';

class SmartphoneCatScreen extends StatefulWidget {
  @override
  _SmartphoneCatScreenState createState() => _SmartphoneCatScreenState();
}

class _SmartphoneCatScreenState extends State<SmartphoneCatScreen> {
  Api api = Api();
  List<ProdutosModel> produtos = [];
  List<ProdutosModel> smartphoneProducts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<ProdutosModel> produtosList = await api.getAllProdutos();
    setState(() {
      produtos = produtosList;
      smartphoneProducts = produtosList
          .where((produto) => produto.category == 'smartphone')
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Smartphones'),
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
                  // Gerar lista com todos os produtos da categoria Smartphones
                  ...List.generate(
                    smartphoneProducts.length,
                    (index) => ProductCard(
                      product: smartphoneProducts[index],
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
