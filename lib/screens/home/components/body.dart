// Página home, conteúdo das categorias e todos os produtos

import 'package:flutter/material.dart';
import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:ladiescode/screens/home/components/CategoriesWidget.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/models/database/Requisicoes.dart';
import 'package:ladiescode/widgets/ItemsWidget.dart';

class Body extends StatefulWidget {
  final List<ProdutosModel> produtos;

  const Body({Key? key, required this.produtos}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Api api = Api();

  // Função de pesquisa
  List<ProdutosModel> searchProdutos(String term) {
    var produtos;
    return produtos
        .where((produto) =>
            produto.title.toLowerCase().contains(term.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<ProdutosModel> produtosList = await api.getAllProdutos();
      setState(() {
        widget.produtos.clear();
        widget.produtos.addAll(produtosList);
      });
    } catch (e) {
      print("Erro ao carregar dados: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),

            // Título "Categorias"
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
              child: Text(
                'Categorias',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: getProportionateScreenHeight(10)),

            // Chamar as categorias de produtos
            CategoriesWidget(),

            SizedBox(height: getProportionateScreenHeight(20)),

            // Título "Todos os Produtos"
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
              child: Text(
                'Todos os Produtos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Chamar a lista de produtos
            ItemsWidget(produtos: widget.produtos),
          ],
        ),
      ),
    );
  }
}
