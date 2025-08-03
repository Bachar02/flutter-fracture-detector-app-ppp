import 'dart:io';
import 'package:flutter/material.dart';

class his_page extends StatefulWidget {
  final List<File> uploadedImages;

  const his_page({Key? key, required this.uploadedImages}) : super(key: key);

  @override
  State<his_page> createState() => _his_pageState();
}

class _his_pageState extends State<his_page> {
  int myIndex = 1;

  @override
  Widget build(BuildContext context) {
    final uploadedImages = widget.uploadedImages;

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
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Text(
              'HISTORY',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
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
              backgroundColor:
              Colors.transparent, // Transparent BottomNavigationBar
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
                    icon: Icon(Icons.home,size: 30,),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.history,size: 30,),
                    onPressed: () {
                      Navigator.pushNamed(context, '/his');
                    },
                  ),
                  label: 'HISTORY',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.star,size: 30,),
                    onPressed: () {
                      Navigator.pushNamed(context, '/fav');
                    },
                  ),
                  label: 'FAVORITES',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.account_circle,size: 30,),
                    onPressed: () {
                      Navigator.pushNamed(context, '/acc');
                    },
                  ),
                  label: 'ACCOUNT',
                ),
              ],
            ),
          ),
          body: GridView.builder(
            itemCount: uploadedImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Image.file(uploadedImages[index]);
            },
          ),
        ),
      ],
    );
  }
}
