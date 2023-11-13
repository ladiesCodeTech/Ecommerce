// Listar apenas a categoria Eletroeletronicos

import 'package:flutter/material.dart';
import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:ladiescode/models/database/Requisicoes.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/widgets/CustomAppBar.dart';
import 'package:ladiescode/widgets/ProductCardWidget.dart';

class EletronicCatScreen extends StatefulWidget {
  @override
  _EletronicCatScreenState createState() => _EletronicCatScreenState();
}

class _EletronicCatScreenState extends State<EletronicCatScreen> {
  Api api = Api();
  List<ProdutosModel> produtos = [];
  List<ProdutosModel> eletronicProducts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<ProdutosModel> produtosList = await api.getAllProdutos();
    setState(() {
      produtos = produtosList;
      eletronicProducts = produtosList
          .where((produto) => produto.category == 'eletroeletronico')
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Eletroeletrônicos'),
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
                  // Gerar lista com todos os produtos da categoria Eletroeletrônicos
                  ...List.generate(
                    eletronicProducts.length,
                    (index) => ProductCard(
                      product: eletronicProducts[index],
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
