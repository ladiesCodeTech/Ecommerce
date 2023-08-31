import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 1; i < 4; i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  color: Color(0xFFFFDDAF),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'images/smartTvs/$i.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Text(
                    'SmartTVs',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
