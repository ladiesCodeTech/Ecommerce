import 'package:flutter/material.dart';
import 'package:ladiescode/widgets/HomeBottomNavBar.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
            color: Colors.white,
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Color(0xFFB6082F),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Categorias',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB6082F)),
                  ),
                ),
              ],
            )),
      ]),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
