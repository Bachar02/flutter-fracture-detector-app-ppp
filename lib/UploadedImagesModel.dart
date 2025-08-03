import 'dart:io';
import 'package:flutter/material.dart';

class UploadedImagesModel with ChangeNotifier {
  final List<File> _uploadedImages = [];

  List<File> get uploadedImages => _uploadedImages;

  void addImage(File image) {
    _uploadedImages.add(image);
    notifyListeners();
  }
}
