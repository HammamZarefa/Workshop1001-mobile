import 'package:get/get.dart';
import 'package:coda_workshop/api/database/dataBaseHelper.dart';

class FavoriteController extends GetxController {

  RxList<Map<String, dynamic>> favorites = <Map<String, dynamic>>[].obs;


  RxSet<int> favoriteIds = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }


  Future<void> loadFavorites() async {
    final dbData = await FavoriteHelper.instance.getFavorites();

   
    final loadedFavorites = List<Map<String, dynamic>>.from(dbData);

    favorites.value = loadedFavorites;

    favoriteIds.value =
        loadedFavorites.map((item) => item["id"] as int).toSet();
  }


  Future<void> toggleFavorite(Map<String, dynamic> product) async {
    final int id = product["id"] as int;

    if (favoriteIds.contains(id)) {
    
      await FavoriteHelper.instance.removeFavorite(id);

    
      favorites.removeWhere((item) => item["id"] == id);
      favoriteIds.remove(id);

      print(" The product has been removed from favorites ${product["title"]}");
    } else {
    
      await FavoriteHelper.instance.addFavorite(product);

      
      favorites.add(Map<String, dynamic>.from(product));
      favoriteIds.add(id);

      print(" The product has been added to favorites ${product["title"]}");
    }

   
    favorites.refresh();
    favoriteIds.refresh();
  }

  
  bool isFavorite(int id) => favoriteIds.contains(id);
}