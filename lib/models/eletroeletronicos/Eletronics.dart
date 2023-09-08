//Tela listagem de produtos Eletroeletronicos
import 'package:ladiescode/models/ProductsList.dart';

class EletronicProduct extends Product {
  EletronicProduct({
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

  static List<Product> eletronicProducts = [
    //Eletroeletronicos 1
    EletronicProduct(
      images: ['images/eletronics/1.webp'],
      title: 'Babá Eletrônica COMFORT VM85 CONNECT LCD 5.0 Wi-Fi Motorola',
      price: 1619.10,
      payments: 'No Pix ou no Cartão de crédito R\$ 49.90',
      rating: 5,
      isFavourite: false,
    ),

    //Eletroeletronicos 2
    EletronicProduct(
      images: ['images/eletronics/2.webp'],
      title: 'Repelente Eletrônico Ultrassônico - Chicco',
      price: 48.90,
      payments: 'No Pix ou no Cartão de crédito R\$ 49,90 ',
      rating: 3,
      isFavourite: false,
    ),

    //Eletroeletronicos 3
    EletronicProduct(
      images: ['images/eletronics/3.webp'],
      title:
          'Purificador de água Consul CPB34ASVNA Refrigeração Eletrônica com Filtragem Classe A, Branco Bivolt',
      price: 499.90,
      payments: 'no Pix ou R\$ 499,90 em 10x de R\$ 49,99 sem juros',
      rating: 4,
      isFavourite: true,
    ),

    //Eletroeletronicos 4
    EletronicProduct(
      images: ['images/eletronics/4.webp'],
      title: 'Cabo Adaptador OTG Tipo-C Usb C Compatível Samsung Pen Drive',
      price: 8.96,
      payments: 'No Pix e no cartão de crédito',
      rating: 5,
      isFavourite: false,
    ),

    //Eletroeletronicos 5
    EletronicProduct(
      images: ['images/eletronics/5.webp'],
      title: 'Câmera Baba Eletrônica Visão Noturna sem fio com Microfone 3 Antenas HD - YOUSEE',
      price: 127.90,
      payments: 'No Pix ou R\$ 127,90 em 2x de R\$ 63,95 sem juros',
      rating: 3,
      isFavourite: false,
    ),

    //Eletroeletronicos 6
    EletronicProduct(
      images: ['images/eletronics/6.webp'],
      title: 'Esteira Eletrônica Dream Fitness Concept 1600 - Dobrável Vel. Máxima 9km/h',
      price: 1599.90,
      payments: 'no Pix ou R\$ 1.599,90 em 10x de R\$ 159,99 sem juros',
      rating: 5,
      isFavourite: true,
    ),
  ];
}
