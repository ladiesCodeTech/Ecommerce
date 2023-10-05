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
        iconTheme: const IconThemeData(
          color: Color(0xFFB7082F),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Alterar Produto",
          style:
              TextStyle(color: Color(0xFFB7082F), fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: TextEditingController(text: product.title),
              decoration: const InputDecoration(label: Text("Titulo")),
              onChanged: (value) => product.title = value,
            ),
            TextField(
              controller: TextEditingController(text: product.description),
              decoration: const InputDecoration(label: Text("Descrição")),
              maxLines: 5,
              onChanged: (value) => product.description = value,
            ),
            TextField(
              controller: TextEditingController(text: product.price.toString()),
              decoration: const InputDecoration(label: Text("Preço")),
              onChanged: (value) => product.price = double.parse(value),
            ),
            TextField(
              controller: TextEditingController(text: product.payments),
              decoration: const InputDecoration(label: Text("Pagamentos")),
              onChanged: (value) => product.payments = value,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    alterarProduto();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFB7082F)),
                  child: const Text("Alterar Produto")),
            )
          ],
        ),
      ),
    );
  }

  void alterarProduto() async {
    bool value = await api.putProduct(product);

    if (value) {
      showSnackBar("Produto Alterado!");
    } else {
      showSnackBar("Falha ao alterar Produto!");
    }
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
