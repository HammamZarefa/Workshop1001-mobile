class CartModel {
  int? status;
  String? message;
  CartData? data;

  CartModel({this.status, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CartData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  void operator [](String other) {}
}

class CartData {
  int? id;
  int? total;
  List<Items>? items;
  String? createdAt;
  String? updatedAt;

  CartData({this.id, this.total, this.items, this.createdAt, this.updatedAt});

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  operator [](int other) {}
}

class Items {
  int? id;
  Product? product;
  String? price;
  String? quantity;
  int? subtotal;

  Items({this.id, this.product, this.price, this.quantity, this.subtotal});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    price = json['price'];
    quantity = json['quantity'];
    subtotal = json['subtotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['subtotal'] = this.subtotal;
    return data;
  }

  void operator [](int other) {}
}

class Product {
  int? id;
  String? title;
  String? image;

  Product({this.id, this.title, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}

class Model {
  int? id;
  String name;
  String image;
  int count;
  double price;

  Model({
    this.id,
    required this.name,
    required this.image,
    required this.count,
    required this.price,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    // Debug
    print('Loading cart item: $json');

    return Model(
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
