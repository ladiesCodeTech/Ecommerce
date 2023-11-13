// Página home, conteúdo da listagem das categorias e todos os produtos, abaixo da logo e barra de buscar.

import 'package:flutter/material.dart';
import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:ladiescode/models/database/Requisicoes.dart';
import 'package:ladiescode/screens/home/components/body.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/screens/home/components/HomeAppBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenStateCustomName();
}

class _HomeScreenStateCustomName extends State<HomeScreen> {
  Api api = Api();
  List<ProdutosModel> produtos = [];
  List<ProdutosModel> produtosFiltrados = [];
  final TextEditingController searchController = TextEditingController();

  void updateSearchTerm(String term) {
    setState(() {
      produtosFiltrados = term.isEmpty
          ? List.from(produtos)
          : produtos
              .where((produto) =>
                  produto.title?.toLowerCase().contains(term.toLowerCase()) ??
                  false)
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: HomeAppBar(
          searchController: searchController, onSearch: updateSearchTerm),
      body: Body(produtos: []),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
