class 
ProductModel {
  final String image;
  final String name;
  final double price;
  bool favorite;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
     this.favorite = false,
  });

  // جاهز لربطه مع API لاحق
}