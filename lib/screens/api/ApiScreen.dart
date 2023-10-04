import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ladiescode/models/ProdutosModel.dart';
import 'package:ladiescode/screens/api/ApiMethods.dart';
import 'package:ladiescode/screens/api/methods-screens/AlterarProduto.dart';
import 'package:ladiescode/screens/api/methods-screens/RegisterProduct.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/widgets/CustomAppBar.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  ApiMethods api = ApiMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar personalizada
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xFFB6082F),
          padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
        ),
        title: Text(
          'Consumo da API',
          style:
              TextStyle(color: Color(0xFFB6082F), fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterProduct()));
              },
              icon: Icon(Icons.add_box_outlined),
              padding: EdgeInsets.only(right: getProportionateScreenWidth(15)),
              color: Color(0xFFB6082F))
        ],
      ),

      // body com a lista de produtos
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<ProductModel>>(
          future: api.getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              List<ProductModel> list = snapshot.data ?? [];
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.photo),
                  trailing: IconButton(
                    onPressed: () {
                      deleleProduct(list[index].id);
                    },
                    icon: Icon(Icons.delete),
                  ),
                  title: Text(
                    list[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    list[index].description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                AlterarProdutosPage(product: list[index])));
                  },
                ),
              );
            }
            return Center(
              child: Text('Erro ao carregar os dados'),
            );
          },
        ),
      ),

      // Navegação inferior
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }

  void deleleProduct(int id) async {
    bool value = await api.deleteProduct(id);

    if (value) {
      showSnackBar('Produto deletado');
    } else {
      showSnackBar('Falha ao deletar produto');
    }
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
