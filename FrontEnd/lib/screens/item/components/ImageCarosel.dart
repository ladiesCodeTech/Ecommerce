// Página produto, conteúdo do carrosel das imagens

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ladiescode/models/database/ProdutosModel.dart';
import 'package:ladiescode/models/database/Requisicoes.dart';
import 'package:ladiescode/size_config.dart';

class ImageCarosel extends StatefulWidget {
  const ImageCarosel({
    super.key,
    required this.product,
  });

  final ProdutosModel product;

  @override
  State<ImageCarosel> createState() => _ImageCaroselState();
}

class _ImageCaroselState extends State<ImageCarosel> {
  Api api = Api();
  late ProdutosModel product;
  int _currentPage = 0;

  @override
  void initState() {
    product = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Imagens dos produtos
        Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(15)),
          width: double.infinity,
          color: Colors.white,
          child: SizedBox(
            height: getProportionateScreenHeight(200),
            child: AspectRatio(
              aspectRatio: 1,
              child: PageView.builder(
                  itemCount: 1,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) => CachedNetworkImage(
                        imageUrl: product.image ?? "",
                      )),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                1, (index) => DotBuilder(isActive: index == _currentPage))),
      ],
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
