import 'dart:io';
import 'package:flutter/material.dart';

class FavoriteImagesModel with ChangeNotifier {
  final List<File> _favoriteImages = [];

  List<File> get favoriteImages => _favoriteImages;

  void addImage(File image) {
    _favoriteImages.add(image);
    notifyListeners();
  }
}