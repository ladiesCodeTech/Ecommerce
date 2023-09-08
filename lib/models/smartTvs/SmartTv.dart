//Tela listagem de produtos SmartTvs
import 'package:ladiescode/models/ProductsList.dart';

class TvProduct extends Product {
  TvProduct({
    required List<String> images,
    required String title,
    required double price,
    required String payments,
    double rating = 0.0,
    bool isFavourite = false,
  }) : super(
          images: images,
          title: title,
          price: price,
          payments: payments,
          rating: rating,
          isFavourite: isFavourite,
        );

  static List<Product> tvProducts = [
    //SmartTv 1
    TvProduct(
      images: [
        'images/smartTvs/1.png',
        'images/smartTvs/2.png',
        'images/smartTvs/3.png',
      ],
      title:
          'Smart TV 32” HD LED TCL S615 VA 60Hz - Android Wi-Fi e Bluetooth Google Assistente 2 HDMI',
      price: 1127.15,
      payments: 'no Pix ou em 8x de R\$ 149,89 sem juros',
      rating: 2,
      isFavourite: true,
    ),

    //SmartTv 2
    TvProduct(
      images: [
        'images/smartTvs/2.png',
        'images/smartTvs/2.png',
        'images/smartTvs/3.png',
      ],
      title: 'Smart TV 32” HD D-LED AOC 32S5135/78G VA - Wi-Fi 3 HDMI 1 USB',
      price: 1091.09,
      payments: 'no Pix ou em 8x de R\$ 149,88 sem juros',
      rating: 3,
      isFavourite: false,
    ),

    //SmartTv 3
    TvProduct(
      images: [
        'images/smartTvs/3.png',
        'images/smartTvs/2.png',
        'images/smartTvs/3.png',
      ],
      title:
          'Smart TV 43” 4K LED TCL 43P635 VA Wi-Fi - Bluetooth HDR Google Assistente 3 HDMI 1 USB',
      price: 1756.55,
      payments: 'no Pix ou em 10x de R\$ 184,90 sem juros',
      rating: 3,
      isFavourite: true,
    ),

    //SmartTv 4
    TvProduct(
      images: [
        'images/smartTvs/4.png',
        'images/smartTvs/2.png',
        'images/smartTvs/3.png',
      ],
      title: 'Smart TV 32” HD LED Semp R6500 Wi-Fi - 3 HDMI 1 USB',
      price: 1091.09,
      payments: 'no Pix ou em 8x de R\$ 149,88 sem juros',
      rating: 3,
      isFavourite: false,
    ),

    //SmartTv 5
    TvProduct(
      images: [
        'images/smartTvs/5.png',
        'images/smartTvs/2.png',
        'images/smartTvs/3.png',
      ],
      title:
          'Smart TV LG 65” 4K Quantum Dot NanoCell 65QNED80 120Hz FreeSync HDMI 2.1 ThinQ',
      price: 7029.05,
      payments: 'no Pix ou em 10x de R\$ 739,90 sem juros',
      rating: 5,
      isFavourite: false,
    ),

    //SmartTv 6
    TvProduct(
      images: [
        'images/smartTvs/6.png',
        'images/smartTvs/2.png',
        'images/smartTvs/3.png',
      ],
      title:
          'Smart TV LG 55” 4K NanoCell 55NANO75 Inteligência Artificial AI ThinQ Smart Magic Google Alexa',
      price: 2799.00,
      payments: 'no Pix ou em 10x de R\$ 279,90 sem juros',
      rating: 4,
      isFavourite: true,
    ),
  ];
}
