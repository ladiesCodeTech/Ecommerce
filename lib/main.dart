import 'package:flutter/material.dart';
import 'package:ladiescode/screens/CategoriesScreen.dart';
import 'package:ladiescode/screens/FavouritesScreen.dart';
import 'package:ladiescode/screens/HomeScreen.dart';
import 'package:ladiescode/screens/ItemScreen.dart';
import 'package:ladiescode/screens/ProfileScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ladies.com',
      theme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodySmall: TextStyle(color: Color(0xFF201A1A)), //12 fontsize
            bodyMedium: TextStyle(color: Color(0xFF201A1A)), //14 fontsize
            bodyLarge: TextStyle(color: Color(0xFF201A1A)), //16 fontsize
          )),

      // Rotas das páginas
      routes: {
        '/': (context) => HomeScreen(),
        'itemScreen': (context) => ItemScreen(),
        'categoriesScreen': (context) => CategoriesScreen(),
        'favouriteScreen': (context) => FavouriteScreen(),
        'profileScreen': (context) => ProfileScreen(),
      },
    );
  }
}
