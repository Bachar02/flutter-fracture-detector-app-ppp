import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ppp/NumberOfContributions.dart';
import 'package:ppp/pages/homepage.dart';

class acc_page extends StatefulWidget {
  const acc_page({Key? key}) : super(key: key);

  @override
  State<acc_page> createState() => _acc_pageState();
}

class _acc_pageState extends State<acc_page> {
  int myIndex = 3;

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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Text(
            'PROFILE',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      //color: Colors.red,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/userpic.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(200)),
                      //child:
                      height: 170,
                      width: 170,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 60,
                  width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'FULL NAME',
                      prefixIcon: Icon(Icons.account_circle, size: 30),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 60,
                  width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      prefixIcon: Icon(Icons.email, size: 30),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 60,
                  width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'ADDRESS',
                      prefixIcon: Icon(Icons.location_on, size: 30),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 320,
                child: Container(
                    child: Center(
                  child: Text(
                    'NUMBER OF CONTRIBUTIONS: $number_of_contributions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
              ),
              SizedBox(
                height: 60,
                width: 320,
                child: Container(
                    child: Center(
                  child: Text(
                    'Joined in April 2024',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    ],
    );
  }
}
