import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Home
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(
                  Icons.home,
                  color: Color(0xFFB6082F),
                )),

            // Categorias
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'categoriesScreen');
                },
                icon: Icon(
                  Icons.sort,
                  color: Color(0xFFB6082F),
                )),

            // Favoritos
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'favouriteScreen');
                },
                icon: Icon(
                  Icons.favorite,
                  color: Color(0xFFB6082F),
                )),

            // Perfil
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'profileScreen');
                },
                icon: Icon(
                  Icons.person,
                  color: Color(0xFFB6082F),
                ))
          ],
        ),
      ),
    );
  }
}
