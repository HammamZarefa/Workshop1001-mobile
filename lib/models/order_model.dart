class OrderModel {
  int? status;
  String? message;
  Data? data;

  OrderModel({this.status, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? shippingAddress;
  Null? status;
  String? currency;
  int? couponValue;
  int? taxAmount;
  int? discountPercentage;
  int? total;
  List<OrderItems>? items;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.shippingAddress,
      this.status,
      this.currency,
      this.couponValue,
      this.taxAmount,
      this.discountPercentage,
      this.total,
      this.items,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippingAddress = json['shipping_address'];
    status = json['status'];
    currency = json['currency'];
    couponValue = json['coupon_value'];
    taxAmount = json['tax_amount'];
    discountPercentage = json['discount_percentage'];
    total = json['total'];
    if (json['items'] != null) {
      items = <OrderItems>[];
      json['items'].forEach((v) {
        items!.add(new OrderItems.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shipping_address'] = this.shippingAddress;
    data['status'] = this.status;
    data['currency'] = this.currency;
    data['coupon_value'] = this.couponValue;
    data['tax_amount'] = this.taxAmount;
    data['discount_percentage'] = this.discountPercentage;
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class OrderItems {
  int? id;
  Product? product;
  String? price;
  String? quantity;
  String? note;
  int? subtotal;

  OrderItems(
      {this.id,
      this.product,
      this.price,
      this.quantity,
      this.note,
      this.subtotal});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    price = json['price'];
    quantity = json['quantity'];
    note = json['note'];
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
    data['note'] = this.note;
    data['subtotal'] = this.subtotal;
    return data;
  }
}

class Product {
  int? id;
  Null? name;
  String? image;

  Product({this.id, this.name, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}