import 'package:flutter/material.dart';
import 'package:ladiescode/screens/categories/CategoriesScreen.dart';
import 'package:ladiescode/screens/favourites/FavouritesScreen.dart';
import 'package:ladiescode/screens/home/HomeScreen.dart';
import 'package:ladiescode/screens/item/ItemScreen.dart';
import 'package:ladiescode/screens/profile/ProfileScreen.dart';

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
          scaffoldBackgroundColor: const Color.fromARGB(255, 87, 13, 13),
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
