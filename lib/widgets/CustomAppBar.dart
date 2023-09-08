import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ladiescode/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(getProportionateScreenHeight(50));
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
        color: Color(0xFFB6082F),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.cart),
            color: Color(0xFFB6082F))
      ],
    );
  }
}