import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import'package:ppp/FavoriteImagesModel.dart';


class fav_page extends StatefulWidget {

  @override

  @override
  State<fav_page> createState() => _fav_pageState();
}

class _fav_pageState extends State<fav_page> {
  int myIndex = 2;

  @override
  Widget build(BuildContext context) {
    final favoriteImages = Provider.of<FavoriteImagesModel>(context).favoriteImages;

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
              'FAVORITES',
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
            itemCount: favoriteImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Image.file(favoriteImages[index]);
            },
          ),
        )
      ],
    );
  }
}
