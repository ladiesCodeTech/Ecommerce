//Página home, conteúdo da logo, barra de buscar, icone sacola de compras e pesquisar
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100.0);

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 1,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Imagem da Logo
          Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
            height: 40,
          ),
          //Conteúdo dentro da barra de buscar
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5, bottom: 5),
                    height: 30,
                    width: 240,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Buscar em Ladies.com',
                          fillColor: Color(0xFFF1F1F1)),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    size: 25,
                    color: Color(0xFF201A1A),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Color(0xFFB6082F),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
