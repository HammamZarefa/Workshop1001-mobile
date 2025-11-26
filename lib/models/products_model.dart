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
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
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
  String? featuredImage;
  List<Gallery>? gallery;
  int? averageRating;

  Data(
      {this.id,
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
      this.featuredImage,
      this.gallery,
      this.averageRating});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    title = json['title'];
    description = json['description'];
    price = json['price'];
    currency = json['currency'];
    stock = json['stock'];
    isActive = json['is_active'];
    isFeatured = json['is_featured'];
    colors = json['colors'].cast<String>();
    featuredImage = json['featured_image'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    averageRating = json['average_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = categoryId;
    if (this.category != null) {
      data['category'] = category!.toJson();
    }
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['currency'] = this.currency;
    data['stock'] = this.stock;
    data['is_active'] = this.isActive;
    data['is_featured'] = this.isFeatured;
    data['colors'] = this.colors;
    data['featured_image'] = this.featuredImage;
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    data['average_rating'] = this.averageRating;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['is_active'] = this.isActive;
    data['icon'] = this.icon;
    data['created_at'] = this.createdAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}