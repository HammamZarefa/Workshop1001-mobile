// class onboardingModel {
//   final String title;
//     final String subtitle;
//     final String description;

//   final String image;
//   onboardingModel({required this.subtitle,required this.description, required this.image, required this.title});
// }



 
class OnBordingModel {
  int? status;
  String? message;
  List<OnBordingModelData>? data;

  OnBordingModel({this.status, this.message, this.data});

  OnBordingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OnBordingModelData>[];
      json['data'].forEach((v) {
        data!.add(new OnBordingModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnBordingModelData {
  int? id;
  String? title;
  String? subtitle;
  String? description;
  List<Images>? images;
  String? createdAt;
  String? updatedAt;

  OnBordingModelData(
      {this.id,
      this.title,
      this.subtitle,
      this.description,
      this.images,
      this.createdAt,
      this.updatedAt});

 OnBordingModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Images {
  int? id;
  String? url;
  String? name;

  Images({this.id, this.url, this.name});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    return data;
  }
}