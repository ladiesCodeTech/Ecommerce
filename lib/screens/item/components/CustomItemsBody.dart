import 'package:flutter/material.dart';
import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/size_config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomItemsBody extends StatefulWidget {
  const CustomItemsBody({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<CustomItemsBody> createState() => _CustomItemsBodyState();
}

class _CustomItemsBodyState extends State<CustomItemsBody> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Imagens dos produtos
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: double.infinity,
              color: Colors.white,
              child: SizedBox(
                height: getProportionateScreenHeight(200),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: PageView.builder(
                        itemCount: widget.product.images.length,
                        onPageChanged: (value) {
                          setState(() {
                            _currentPage = value;
                          });
                        },
                        itemBuilder: (context, index) =>
                            Image.asset(widget.product.images[index]))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.product.images.length,
                    (index) => DotBuilder(isActive: index == _currentPage))),

            // Padding para iniciar o título
            Padding(
                padding:
                    EdgeInsets.only(top: getProportionateScreenHeight(10))),

            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(16)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                bottom: getProportionateScreenHeight(5)),
                            alignment: Alignment.centerLeft,
                            child: RatingBarIndicator(
                              rating: widget.product.rating,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Color(0xFFB6082F),
                              ),
                              itemCount: 5,
                              itemSize: 12,
                              direction: Axis.horizontal,
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

// Classe para construir as bolinhas de navegação da imagem
class DotBuilder extends StatelessWidget {
  const DotBuilder({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(5)),
        height: getProportionateScreenHeight(8),
        width: getProportionateScreenWidth(8),
        decoration: BoxDecoration(
            color: isActive ? Color(0xFF606060) : Color(0xFFBFBFBF),
            borderRadius: BorderRadius.circular(5)));
  }
}
