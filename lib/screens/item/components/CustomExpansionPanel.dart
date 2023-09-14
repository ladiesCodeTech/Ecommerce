import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/size_config.dart';

// class ItemModel {
//   ItemModel({
//     required this.headerText,
//     required this.expandedText,
//     this.isExpanded = false,
//   });
//   String headerText;
//   String expandedText;
//   bool isExpanded;
// }

class CustomExpansionPanel extends StatefulWidget {
  const CustomExpansionPanel({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<CustomExpansionPanel> createState() => _CustomExpansionPanelState();
}

class _CustomExpansionPanelState extends State<CustomExpansionPanel> {
  bool _customText = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ExpansionTile(
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

        tilePadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(3)),

        title: Text(
          'Descrição do produto',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: _customText ? Colors.black : Colors.black),
        ),
        trailing: Text(
          _customText ? 'ver menos' : 'ver mais',
          style: TextStyle(
              color: Color(0xFFB6082F),
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        // Icon(_customIcon ? Icons.arrow_drop_up : Icons.arrow_drop_down),
        children: [
          ListTile(
            title: Text(widget.product.description),
          )
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _customText = expanded;
          });
        },
      ),
    );
  }
}
