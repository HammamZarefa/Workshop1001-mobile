class BannerModel {
  List<Data>? data;

  BannerModel({this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? link;
  int? isActive;
  int? sortOrder;
  String? image;

  Data(
      {this.id,
      this.title,
      this.description,
      this.link,
      this.isActive,
      this.sortOrder,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    isActive = json['is_active'];
    sortOrder = json['sort_order'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['link'] = link;
    data['is_active'] = isActive;
    data['sort_order'] = sortOrder;
    data['image'] = image;
    return data;
  }
}
