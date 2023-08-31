import 'package:ladiescode/models/cellphone/cellphone.dart';
import 'package:ladiescode/models/eletronics/eletronics.dart';
import 'package:ladiescode/models/smartTvs/smart_tvs.dart';

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

// Lista com todos as tvs
List<Product> tvProducts = []..addAll(TvProduct.tvProducts);

// Lista com todos os eletrônicos
List<Product> eletronicProducts = []
  ..addAll(EletronicProduct.eletronicProducts);

// Lista com todos os telefones
List<Product> cellphoneProducts = []
  ..addAll(CellphoneProducts.cellphoneProducts);

// Lista com todos os produtos
List<Product> allProducts = []
  ..addAll(TvProduct.tvProducts)
  ..addAll(EletronicProduct.eletronicProducts)
  ..addAll(CellphoneProducts.cellphoneProducts);
