//Página cadastrar produto

import 'package:ladiescode/models/database/Requisicoes.dart';
import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:flutter/material.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';

class CadastrarProduto extends StatefulWidget {
  const CadastrarProduto({super.key});

  @override
  State<CadastrarProduto> createState() => _CadastrarProdutoState();
}

class _CadastrarProdutoState extends State<CadastrarProduto> {
  Api api = Api();
  int id = 0;
  String title = "";
  String description = "";
  String payments = "";
  double price = 0;
  String category = "";
  String image = "";

  TextEditingController priceController = TextEditingController();

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
          "Cadastrar Produto",
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
              decoration: const InputDecoration(label: Text("Título")),
              onChanged: (valor) => title = valor,
            ),
            TextField(
              decoration:
                  const InputDecoration(label: Text("Descrição do Produto")),
              maxLines: 5,
              onChanged: (valor) => description = valor,
            ),
            TextField(
              decoration:
                  const InputDecoration(label: Text("Formas de Pagamento")),
              onChanged: (valor) => payments = valor,
            ),
            TextField(
              decoration: const InputDecoration(label: Text("Preço")),
              controller: priceController,
              onChanged: (valor) {
                setState(() {
                  price = double.tryParse(valor) ?? 0;
                });
              },
            ),
            TextField(
              decoration:
                  const InputDecoration(label: Text("Categoria do Pagamento")),
              onChanged: (valor) => category = valor,
            ),
            TextField(
              decoration:
                  const InputDecoration(label: Text("Imagem do Produto")),
              onChanged: (valor) => image = valor,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  onPressed: () {
                    salvarPost();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFB6082F)),
                  ),
                  child: const Text(
                    "Cadastrar Produto",
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

  void salvarPost() async {
    bool valor = await api.cadastrarProdutos(ProdutosModel(
      id: id,
      title: title,
      description: description,
      payments: payments,
      price: priceController.text.isEmpty
          ? 0
          : double.tryParse(priceController.text) ?? 0,
      category: category,
      image: image,
    ));

    if (valor) {
      showSnackBar("Produto Cadastrado!");
    } else {
      showSnackBar("Falha ao Cadastrar Produto!");
    }
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
