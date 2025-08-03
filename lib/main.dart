import 'dart:io';
import'package:ppp/UploadedImagesModel.dart';
import 'package:flutter/material.dart';
import 'package:ppp/pages/account_page.dart';
import 'package:ppp/pages/fav_page.dart';
import 'package:ppp/pages/his_page.dart';
import 'package:ppp/pages/homepage.dart';
import 'package:provider/provider.dart';
import'package:ppp/FavoriteImagesModel.dart';
import 'package:ppp/NumberOfContributions.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FavoriteImagesModel()),
      ChangeNotifierProvider(create: (context) => UploadedImagesModel()),
      ChangeNotifierProvider(create: (context) => NumberOfContributions()),
    ],
    child: MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<File> favoriteImages = [];
  final List<File> uploadedImages = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(
        onImageAddedToFavorites: (image) {
          favoriteImages.add(image);
          uploadedImages.add(image);
          setState(() {});
        },
      ),
      routes: {
        '/acc': (context) => acc_page(),
        '/fav': (context) => fav_page(),
        '/his': (context) => his_page(uploadedImages: uploadedImages),
        '/home': (context) => homepage(
                    onImageAddedToFavorites: (image) {
                    favoriteImages.add(image);
                    uploadedImages.add(image);
                    setState(() {});
                    },
                    ),
      },
    );
  }
}