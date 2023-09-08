import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomItemsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        color: Colors.amber,
        height: 200,
      ),
    ));
  }
}
