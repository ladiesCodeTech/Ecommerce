//Página listagem de produto selecionado
import 'package:flutter/material.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/widgets/CustomAppBar.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(),

      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.arrow_back_ios),
      //     color: Color(0xFFB6082F),
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(Icons.shopping_cart),
      //         color: Color(0xFFB6082F))
      //   ],
      // ),

      // body: ListView(children: [
      //   Container(
      //       color: Color(0xFFFFFFFF),
      //       padding: EdgeInsets.all(25),
      //       child: Row(
      //         children: [
      //           InkWell(
      //             onTap: () {
      //               Navigator.pop(context);
      //             },
      //             child: Icon(
      //               Icons.arrow_back_ios,
      //               size: 30,
      //               color: Color(0xFFB6082F),
      //             ),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.only(left: 5),
      //             child: Text(
      //               'Produtos',
      //               style: TextStyle(
      //                   fontSize: 23,
      //                   fontWeight: FontWeight.bold,
      //                   color: Color(0xFFB6082F)),
      //             ),
      //           ),
      //         ],
      //       ))
      // ]),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
