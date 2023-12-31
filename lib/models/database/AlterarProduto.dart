//Página alterar produto

import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:flutter/material.dart';
import 'package:ladiescode/models/database/Requisicoes.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';

class AlterarProduto extends StatefulWidget {
  final ProdutosModel produto;
  const AlterarProduto({super.key, required this.produto});

  @override
  State<AlterarProduto> createState() => _AlterarProdutoState();
}

class _AlterarProdutoState extends State<AlterarProduto> {
  Api api = Api();
  late ProdutosModel produto;

  @override
  void initState() {
    produto = widget.produto;
    super.initState();
  }

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
          "Alterar Produto",
          style: TextStyle(
            color: Color(0xFFB6082F),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: TextEditingController(text: produto.title),
              decoration: const InputDecoration(label: Text("Nome do Produto")),
              maxLines: 2,
              onChanged: (valor) => produto.title = valor,
            ),
            TextField(
              controller: TextEditingController(text: produto.description),
              decoration:
                  const InputDecoration(label: Text("Descrição do Produto")),
              maxLines: 6,
              onChanged: (valor) => produto.description = valor,
            ),
            TextField(
              controller: TextEditingController(text: produto.payments),
              decoration:
                  const InputDecoration(label: Text("Formas de Pagamento")),
              maxLines: 2,
              onChanged: (valor) => produto.payments = valor,
            ),
            TextField(
              controller: TextEditingController(
                  text: produto.price?.toStringAsFixed(
                      2)), //Converte o double para uma string com 2 casas decimais
              decoration: const InputDecoration(label: Text("Preço")),
              onChanged: (valor) {
                produto.price = double.tryParse(valor.replaceAll(',', '.')) ??
                    0.0; //Substitui ',' por '.' e converte para double
              },
            ),
            TextField(
              controller: TextEditingController(text: produto.category),
              decoration:
                  const InputDecoration(label: Text("Categoria do Produto")),
              onChanged: (valor) => produto.category = valor,
            ),
            TextField(
              controller: TextEditingController(text: produto.image),
              decoration:
                  const InputDecoration(label: Text("Imagem do Produto")),
              onChanged: (valor) => produto.image = valor,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  onPressed: () {
                    salvarProduto();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFB6082F)),
                  ),
                  child: const Text(
                    "Alterar Produto",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }

  void salvarProduto() async {
    bool valor = await api.alterarProdutos(produto);

    if (valor) {
      showSnackBar("Produto Alterado!");
    } else {
      showSnackBar("Falha ao Alterar Produto!");
    }
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
