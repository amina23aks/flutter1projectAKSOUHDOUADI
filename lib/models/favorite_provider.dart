import 'package:flutter/material.dart';

class FavoriteItem {
  final String name;
  final String subTitle;
  final String price;
  final String image;

  FavoriteItem({
    required this.name,
    required this.subTitle,
    required this.price,
    required this.image,
  });
}

class FavoriteProvider with ChangeNotifier {
  List<FavoriteItem> _favoriteItems = [];

  List<FavoriteItem> get favoriteItems => _favoriteItems;

  void addToFavorites(String name, String subTitle, String price, String image) {
    _favoriteItems.add(FavoriteItem(
      name: name,
      subTitle: subTitle,
      price: price,
      image: image,
    ));
    notifyListeners();
  }

  void removeFromFavorites(String name) {
    _favoriteItems.removeWhere((item) => item.name == name);
    notifyListeners();
  }
}
