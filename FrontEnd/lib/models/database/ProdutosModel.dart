// Model da classe dos dados recebidos e enviados para API.

class ProdutosModel {
  int id;
  String? title;
  String? description;
  String? payments;
  double? price;
  String? category;
  String? image;
  final double rating;
  final bool isFavourite;

  ProdutosModel({
    required this.id,
    required this.title,
    required this.description,
    required this.payments,
    required this.price,
    required this.category,
    required this.image,
    this.rating = 0.0,
    this.isFavourite = false,
  });

  factory ProdutosModel.fromJson(Map<String, dynamic> json) => ProdutosModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        payments: json["payments"],
        price: json["price"]?.toDouble(),
        category: json["category"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "payments": payments,
        "price": price,
        "category": category,
        "image": image,
      };
}
