import 'dart:convert';

class ProductModel {
  int? status;
  String? message;
  List<Data>? data;

  ProductModel({this.status, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? categoryId;
  Category? category;
  String? title;
  String? description;
  int? price;
  String? currency;
  int? stock;
  bool? isActive;
  bool? isFeatured;
  List<String>? colors;
  bool? isSpecial;
  String? featuredImage;
  List<Gallery>? gallery;
  double? averageRating;

  Data({
    this.id,
    this.categoryId,
    this.category,
    this.title,
    this.description,
    this.price,
    this.currency,
    this.stock,
    this.isActive,
    this.isFeatured,
    this.colors,
    this.isSpecial,
    this.featuredImage,
    this.gallery,
    this.averageRating,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    title = json['title'];
    description = json['description'];
    price = json['price'];
    currency = json['currency'];
    stock = json['stock'];
    isActive = json['is_active'];
    isFeatured = json['is_featured'];

    colors = _parseColors(json['colors']);

    isSpecial = json['is_special'];
    featuredImage = json['featured_image'];

    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(Gallery.fromJson(v));
      });
    }

    averageRating = json['average_rating'] != null
        ? (json['average_rating'] as num).toDouble()
        : null;
  }

  List<String> _parseColors(dynamic raw) {
    if (raw == null) return [];

    if (raw is List) {
      return List<String>.from(raw);
    }

    if (raw is String) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is List) {
          return List<String>.from(decoded);
        }
      } catch (e) {
        return [];
      }
    }

    return [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['category_id'] = categoryId;

    if (category != null) {
      data['category'] = category!.toJson();
    }

    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['currency'] = currency;
    data['stock'] = stock;
    data['is_active'] = isActive;
    data['is_featured'] = isFeatured;
    data['colors'] = colors;
    data['is_special'] = isSpecial;
    data['featured_image'] = featuredImage;

    if (gallery != null) {
      data['gallery'] = gallery!.map((v) => v.toJson()).toList();
    }

    data['average_rating'] = averageRating;

    return data;
  }
}

class Category {
  int? id;
  String? title;
  int? isActive;
  String? icon;
  String? createdAt;

  Category({this.id, this.title, this.isActive, this.icon, this.createdAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isActive = json['is_active'];
    icon = json['icon'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['is_active'] = isActive;
    data['icon'] = icon;
    data['created_at'] = createdAt;
    return data;
  }
}

class Gallery {
  int? id;
  String? url;

  Gallery({this.id, this.url});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}
