class Produto {
    int id;
    String title;
    String description;
    double price;
    String payments;

    Produto({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.payments,
    });

    factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      price: (json["price"] ?? 0.0).toDouble(),
      payments: json["payments"] ?? "",
    );
  }

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "payments": payments,
    };
}
