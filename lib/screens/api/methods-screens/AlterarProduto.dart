import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProdutosModel.dart';
import 'package:ladiescode/screens/api/ApiMethods.dart';

class AlterarProdutosPage extends StatefulWidget {
  final ProductModel product;
  const AlterarProdutosPage({super.key, required this.product});

  @override
  State<AlterarProdutosPage> createState() => _AlterarProdutosPageState();
}

class _AlterarProdutosPageState extends State<AlterarProdutosPage> {
  ApiMethods api = ApiMethods();
  late ProductModel product;

  @override
  void initState() {
    product = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produto"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: TextEditingController(text: product.title),
              decoration: const InputDecoration(label: Text("Titulo")),
              onChanged: (valor) => product.title = valor,
            ),
            TextField(
              controller: TextEditingController(text: product.description),
              decoration: const InputDecoration(label: Text("Descrição")),
              maxLines: 5,
              onChanged: (valor) => product.description= valor,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    alterarProduto();
                  },
                  child: const Text("Alterar Produto")),
            )
          ],
        ),
      ),
    );
  }

  void alterarProduto() async {
    bool valor = await api.putProduct(product);

    if (valor) {
      showSnackBar("Produto Alterado!");
    } else {
      showSnackBar("Falha ao alterar Produto!");
    }
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}