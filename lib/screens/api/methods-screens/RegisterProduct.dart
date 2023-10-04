import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProdutosModel.dart';
import 'package:ladiescode/screens/api/ApiMethods.dart';
import '../../../models/ProductsList.dart';

class RegisterProduct extends StatefulWidget {
  const RegisterProduct({super.key});

  @override
  State<RegisterProduct> createState() => _RegisterProductState();
}

class _RegisterProductState extends State<RegisterProduct> {
  ApiMethods api = ApiMethods();
  String title = "";
  String description = "";
  double price = 0;
  String payments = "";
  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de  Produtos"),
        backgroundColor: const Color(0xFFB7082F),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Título"),
              onChanged: (value) => title = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Descrição"),
              maxLines: 5,
              onChanged: (value) => description = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Preço"),
              onChanged: (value) {
                setState(() {
                  price = double.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Pagamentos"),
              onChanged: (value) => payments = value,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  salvarPost();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB7082F),
                ),
                child: const Text("Cadastrar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void salvarPost() async {
    bool valor = await api.postProduct(ProductModel(
      title: title,
      description: description,
      price: price,
      payments: payments,
      id: id,
    ));

    if (valor) {
      showSnackBar("Produto cadastrado com sucesso!");
    } else {
      showSnackBar("Falha ao cadastar produto!");
    }
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
