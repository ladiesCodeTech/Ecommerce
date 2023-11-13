// Página de listagem de todos os produtos na tela configuração produtos

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ladiescode/models/database/DescricaoProduto.dart';
import 'package:ladiescode/models/database/Requisicoes.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:ladiescode/models/database/AlterarProduto.dart';
import 'package:ladiescode/models/database/CadastrarProduto.dart';

class ListarProdutos extends StatefulWidget {
  const ListarProdutos({Key? key}) : super(key: key);

  @override
  State<ListarProdutos> createState() => _ListarProdutosState();
}

class _ListarProdutosState extends State<ListarProdutos> {
  Api api = Api();
  List<ProdutosModel> produtos = [];
  List<ProdutosModel> produtosFiltrados = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<ProdutosModel> produtosList = await api.getAllProdutos();
      setState(() {
        produtos = produtosList;
        produtosFiltrados = produtosList;
      });
    } catch (e) {
      print("Erro ao carregar dados: $e");
    }
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
          "Configuração Produtos",
          style: TextStyle(
            color: Color(0xFFB6082F),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CadastrarProduto()),
              );
            },
            icon: Icon(
              Icons.post_add,
              color: Color(0xFFB6082F),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          produtosFiltrados = produtos
                              .where((produto) =>
                                  produto.title
                                      ?.toLowerCase()
                                      .contains(value.toLowerCase()) ??
                                  false)
                              .toList();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Pesquisar Produtos',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Cor de fundo
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: produtosFiltrados.length,
                itemBuilder: (context, index) => Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      if (produtosFiltrados[index].image != null)
                        buildImageWidget(produtosFiltrados[index].image!),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            produtosFiltrados[index].title ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Divider(),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DescricaoProduto(
                                  produto: produtosFiltrados[index]),
                            ),
                          );
                        },
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                navigateToEditScreen(produtosFiltrados[index]);
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                deletePost(produtosFiltrados[index].id);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ],
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

  Widget buildImageWidget(dynamic images) {
    if (images is List<String>) {
      // Exibindo múltiplas imagens (caso `image` seja uma lista de strings)
      return Row(
        children: images.map((url) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl: url,
              width: 100,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      );
    } else if (images is String) {
      // Exibindo uma única imagem (caso `image` seja uma string)
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CachedNetworkImage(
          imageUrl: images,
          width: 100,
          fit: BoxFit.cover,
        ),
      );
    } else {
      // Outro caso (por exemplo, `null`)
      return Container();
    }
  }

  void navigateToEditScreen(ProdutosModel produto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AlterarProduto(produto: produto),
      ),
    );
  }

  void deletePost(int id) async {
    bool valor = await api.deletarProdutos(id);

    if (valor) {
      showSnackBar("Produto deletado!");
    } else {
      showSnackBar("Falha ao deletar Produto!");
    }
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
