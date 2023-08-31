import 'package:flutter/material.dart';
import 'package:ladiescode/widgets/HomeBottomNavBar.dart';
import 'package:ladiescode/widgets/CategoriesWidget.dart';
import 'package:ladiescode/widgets/HomeAppBar.dart';
import 'package:ladiescode/widgets/ItemsWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: HomeAppBar(),

      body: ListView(
        children: [
          // Título categorias
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                // Título de categorias
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text('Categorias',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF201A1A),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: CategoriesWidget(),
                )

                // Lista de categorias
              ],
            ),
          ),

          // Título de ítens
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(
              'Todos os ítens',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF201A1A)),
            ),
          ),

          // Lista de ítens
          ItemsWidget(),
        ],
      ),

      // Barra de navegação
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
