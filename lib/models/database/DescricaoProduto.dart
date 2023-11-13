// Página descricão do produto selecionado

import 'package:flutter/material.dart';
import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';

class DescricaoProduto extends StatelessWidget {
  final ProdutosModel produto;

  const DescricaoProduto({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xFFB6082F),
          padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
        ),
        title: Text(
          "Descrição do Produto",
          style: TextStyle(
            color: Color(0xFFB6082F),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText("Título", produto.title ?? ""),
            _buildDivider(),
            _buildText("Descrição", produto.description ?? ""),
            _buildDivider(),
            _buildText("Formas de Pagamento", produto.payments ?? ""),
            _buildDivider(),
            _buildText(
              "Preço",
              "R\$ ${produto.price?.toStringAsFixed(2) ?? 'N/A'}",
            ),
            _buildDivider(),
            _buildText("Categoria", produto.category ?? ""),
            _buildDivider(),
            _buildText("Imagem", produto.image ?? ""),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }

  Widget _buildText(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title: $value"),
        SizedBox(height: 8), // Adiciona um espaço vertical entre os textos
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 1,
      color: Colors.grey.shade300,
    );
  }
}
