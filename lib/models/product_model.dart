class CartModel {
  int? id;
  String name;
  String image;
  int count;
  double price;

  CartModel({
    this.id,
    required this.name,
    required this.image,
    required this.count,
    required this.price,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    // Debug
    print('Loading cart item: $json');

    return CartModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? " Name",
      image: json["image"] ?? "",
      count: json["count"] ?? 1,
      price: double.tryParse(json["price"]?.toString() ?? "0") ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "count": count,
      "price": price,
    };
  }
}
