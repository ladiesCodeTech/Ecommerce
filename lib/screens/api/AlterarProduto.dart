import 'package:consumo_api_class/api/api.dart';
import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProdutosModel.dart';

class AlterarProdutosPage extends StatefulWidget {
  final Produto produto;
  const AlterarProdutosPage({super.key, required this.produto});

  @override
  State<AlterarProdutosPage> createState() => _AlterarProdutosPageState();
}

class _AlterarProdutosPageState extends State<AlterarProdutosPage> {
  Api api = Api();
  late Produto produto;

  @override
  void initState() {
    produto = widget.produto;
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
              controller: TextEditingController(text: produto.title),
              decoration: const InputDecoration(label: Text("Titulo")),
              onChanged: (valor) => produto.title = valor,
            ),
            TextField(
              controller: TextEditingController(text: produto.description),
              decoration: const InputDecoration(label: Text("Descrição")),
              maxLines: 5,
              onChanged: (valor) => produto.description= valor,
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
    bool valor = await api.alterarProduto(produto);

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