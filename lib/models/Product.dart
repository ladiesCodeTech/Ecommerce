import 'package:flutter/material.dart';

class Product {
  final String title, images, payments;
  final double rating, price;
  final bool isFavourite;

  Product({
    required this.images,
    required this.title,
    required this.price,
    required this.payments,
    this.rating = 0.0,
    this.isFavourite = false,
  });
}

// Lista de produtos
List<Product> demoProducts = [
  // TV 1
  Product(
    images: 'images/smartTvs/1.png',
    title:
        'Smart TV 32” HD LED TCL S615 VA 60Hz - Android Wi-Fi e Bluetooth Google Assistente 2 HDMI',
    price: 1127.15,
    payments: 'no Pix ou em 8x de R\$ 149,89 sem juros',
    rating: 2,
    isFavourite: true,
  ),
  // TV 2
  Product(
    images: 'images/smartTvs/2.png',
    title: 'Smart TV 32” HD D-LED AOC 32S5135/78G VA - Wi-Fi 3 HDMI 1 USB',
    price: 1091.09,
    payments: 'no Pix ou em 8x de R\$ 149,88 sem juros',
    rating: 3,
    isFavourite: false,
  ),
  // TV 3
  Product(
    images: 'images/smartTvs/3.png',
    title:
        'Smart TV 43” 4K LED TCL 43P635 VA Wi-Fi - Bluetooth HDR Google Assistente 3 HDMI 1 USB',
    price: 1756.55,
    payments: 'no Pix ou em 10x de R\$ 184,90 sem juros',
    rating: 3,
    isFavourite: true,
  ),
  // TV 4
  Product(
    images: 'images/smartTvs/4.png',
    title: 'Smart TV 32” HD LED Semp R6500 Wi-Fi - 3 HDMI 1 USB',
    price: 1091.09,
    payments: 'no Pix ou em 8x de R\$ 149,88 sem juros',
    rating: 3,
    isFavourite: false,
  ),
  // TV 5
  Product(
    images: 'images/smartTvs/5.png',
    title:
        'Smart TV LG 65” 4K Quantum Dot NanoCell 65QNED80 120Hz FreeSync HDMI 2.1 ThinQ',
    price: 7029.05,
    payments: 'no Pix ou em 10x de R\$ 739,90 sem juros',
    rating: 5,
    isFavourite: false,
  ),
  // TV 6
  Product(
    images: 'images/smartTvs/6.png',
    title:
        'Smart TV LG 55” 4K NanoCell 55NANO75 Inteligência Artificial AI ThinQ Smart Magic Google Alexa',
    price: 2799.00,
    payments: 'no Pix ou em 10x de R\$ 279,90 sem juros',
    rating: 4,
    isFavourite: true,
  ),
];
