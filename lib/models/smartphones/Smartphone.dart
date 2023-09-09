//Tela listagem de produtos Smartphones
import 'package:ladiescode/models/ProductsList.dart';

class SmartphoneProducts extends Product {
  SmartphoneProducts({
    required List<String> images,
    required String title,
    required String description,
    required double price,
    required String payments,
    double rating = 0.0,
    bool isFavourite = false,
  }) : super(
          images: images,
          title: title,
          description: description,
          price: price,
          payments: payments,
          rating: rating,
          isFavourite: isFavourite,
        );

  static List<Product> smartphoneProducts = [
    //Smartphones 1
    SmartphoneProducts(
      images: ['images/smartphones/1.webp'],
      title: 'Smartphone Xiaomi Note 12S 256GB - 8GB Ram',
      description: '##Adicionar descrição do produto##',
      price: 1620.90,
      payments: 'no Pix ou em 10x de R\$ 162,00 sem juros',
      rating: 2,
      isFavourite: true,
    ),

    //Smartphones 2
    SmartphoneProducts(
      images: ['images/smartphones/2.webp'],
      title: 'Smartphone Xiaomi Redmi Note 12 128GB - 4GB Ram',
      description: '##Adicionar descrição do produto##',
      price: 1380.00,
      payments: 'no Pix ou em 10x de R\$ 138,00 sem juros',
      rating: 3,
      isFavourite: false,
    ),

    //Smartphones 3
    SmartphoneProducts(
      images: ['images/smartphones/3.webp'],
      title:
          'Smartphone Samsung Galaxy A54 128GB 5G Octa-Core 8GB RAM 6,4" Câm. Tripla + Selfie 32MP Dual Chip',
      description: '##Adicionar descrição do produto##',
      price: 1999.00,
      payments: 'no Pix ou em 10x de R\$ 222,11 sem juros',
      rating: 3,
      isFavourite: true,
    ),

    //Smartphones 4
    SmartphoneProducts(
      images: ['images/smartphones/4.webp'],
      title: 'Smartphone Xiaomi Redmi Note 12 128GB - 4GB Ram',
      description: '##Adicionar descrição do produto##',
      price: 1380.00,
      payments: 'no Pix ou em 10x de R\$ 138,00 sem juros',
      rating: 3,
      isFavourite: false,
    ),

    //Smartphones 5
    SmartphoneProducts(
      images: ['images/smartphones/5.webp'],
      title: 'Smartphone Xiaomi Pocophone Poco X5 5G 128GB 6gb Ram',
      description: '##Adicionar descrição do produto##',
      price: 1800.00,
      payments: 'no Pix ou em 10x de R\$ 180,00 sem juros',
      rating: 5,
      isFavourite: false,
    ),

    //Smartphones 6
    SmartphoneProducts(
      images: ['images/smartphones/6.webp'],
      title: 'Smartphone Xiaomi Redmi 12C 128GB - 6GB Ram',
      description: '##Adicionar descrição do produto##',
      price: 1099.00,
      payments: 'no Pix ou em 10x de R\$ 109,90 sem juros',
      rating: 4,
      isFavourite: true,
    ),
  ];
}
