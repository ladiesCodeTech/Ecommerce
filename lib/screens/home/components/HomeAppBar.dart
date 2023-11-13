// Página home, conteúdo da logo, barra de buscar, icone carrinho de compras

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ladiescode/size_config.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(getProportionateScreenHeight(100));

  final TextEditingController searchController;
  final Function(String) onSearch;

  HomeAppBar({required this.searchController, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 1,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagem da Logo
          Container(
            padding: EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.contain,
              height: getProportionateScreenHeight(40),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Barra de pesquisa
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15)),
                  height: getProportionateScreenHeight(30),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            right: getProportionateScreenWidth(5),
                            bottom: getProportionateScreenHeight(5)),
                        width: getProportionateScreenWidth(240),
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xFFF1F1F1),
                            hintText: 'Buscar em Ladies.com',
                          ),
                          onChanged: (value) {
                            onSearch(value);
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          onSearch(searchController.text);
                        },
                        child: Icon(
                          Icons.search,
                          size: getProportionateScreenHeight(25),
                          color: Color(0xFF201A1A),
                        ),
                      ),
                    ],
                  ),
                ),

                // Icone carrinho
                Container(
                  child: Icon(
                    CupertinoIcons.cart,
                    size: getProportionateScreenHeight(30),
                    color: Color(0xFFB6082F),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
