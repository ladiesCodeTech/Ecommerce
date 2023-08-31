import 'package:flutter/material.dart';
import 'package:ladiescode/size_config.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100.0);

  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Local da logo
          Container(
              padding:
                  EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
              child: Text(
                'Ladies.com',
                style: TextStyle(
                    color: Color(0xFFB6082F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15)),
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15)),
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFFE6E6E6),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  // barra de pesquisa
                  Container(
                    margin: EdgeInsets.only(
                        left: getProportionateScreenWidth(5),
                        bottom: getProportionateScreenWidth(5)),
                    height: 30,
                    width: 240,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Buscar em Ladies.com',
                          fillColor: Color(0xFFE6E6E6)),
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
              margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
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
