import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category {
  final String pathImage;
  final String visibleName;

  Category(this.pathImage, this.visibleName);

}

Map<String, String> getCategoriesAvailable() {
  return <String, String>
  {
    "assets/images/categories/Netflix.png" : "Netflix",
  "assets/images/categories/Shopee.png": "Shoppee",
  "assets/images/categories/Spotify.png": "Spotify",
  };
}
