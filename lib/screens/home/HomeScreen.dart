import 'package:flutter/material.dart';
import 'package:ladiescode/screens/home/components/body.dart';
import 'package:ladiescode/size_config.dart';
import 'package:ladiescode/widgets/BottomNavBar.dart';
import 'package:ladiescode/screens/home/components/HomeAppBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: HomeAppBar(),

      // conteúdo do app
      body: Body(),

      // Barra de navegação
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
