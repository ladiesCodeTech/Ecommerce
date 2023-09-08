import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ladiescode/screens/item/components/CustomCarouselSlider.dart';
import 'package:ladiescode/size_config.dart';

class CustomItemsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: CustomCarouselSlider(),
    ));
  }
}
