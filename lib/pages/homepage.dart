import 'dart:io';
import 'package:ppp/UploadedImagesModel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ppp/FavoriteImagesModel.dart';
import 'package:ppp/bone_fracture_detector.dart';
import 'package:ppp/NumberOfContributions.dart';

int number_of_contributions = 0;


class homepage extends StatefulWidget {
  final Function(File) onImageAddedToFavorites;
  homepage({required this.onImageAddedToFavorites, Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int myIndex = 0;
  File? image;
  String statusText = '';


  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  Future<void> handleImage() async {
    if (image != null) {
      Provider.of<UploadedImagesModel>(context, listen: false).addImage(image!);
      String result = await detectImage(image!);
      setState(() {
        statusText = result;
        print("Image status: $statusText");
      });
    }
    number_of_contributions++;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/backgrndppp.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Bone Fracture Detector',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
              iconSize: 36,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  myIndex = index;
                });
              },
              backgroundColor: Colors.transparent,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: myIndex,
              selectedItemColor: Colors.blueAccent,
              unselectedItemColor: Colors.black,
              elevation: 0,
              iconSize: 24,
              items: [
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(
                      Icons.history,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/his');
                    },
                  ),
                  label: 'HISTORY',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(
                      Icons.star,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/fav');
                    },
                  ),
                  label: 'FAVORITES',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/acc');
                    },
                  ),
                  label: 'ACCOUNT',
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(50, 50, 50, 50),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: image != null
                      ? FileImage(image!) as ImageProvider
                      : AssetImage("images/test3.png"),
                  fit: BoxFit.fill,
                ),
                ),
                height: 350,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                padding: EdgeInsets.all(8),
                child: Text(
                  statusText.isNotEmpty ? statusText : 'Status: intact bone',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 80),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await pickImage();
                      await handleImage();
                    },
                    child: const Text(
                      'Add image',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.star_border,
                      size: 33,
                    ),
                    onPressed: () {
                      if (image != null) {
                        Provider.of<FavoriteImagesModel>(context, listen: false).addImage(image!);
                      }
                    },
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
