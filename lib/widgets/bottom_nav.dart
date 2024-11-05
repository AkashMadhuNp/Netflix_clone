import 'package:apifinal/screens/Downloadds/download.dart';
import 'package:apifinal/screens/Home/home_screen.dart';
import 'package:apifinal/screens/NewHot/new_hot.dart';
import 'package:apifinal/screens/Search/search_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar:Container(
          color: Colors.black,
          height: 70,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),

              Tab(
                icon: Icon(Icons.photo_library_outlined),
                text: "New & Hot",
              ),

              

              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),

              Tab(
                icon: Icon(Icons.download),
                text: "Downloads",
              ),

              



          ],
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Color(0xff999999      ),
          ),
        ) ,


        body: TabBarView(
          children: [
          HomeScreen(),
           NewHotScreen(),
           SearchScreen(),
          
           DosnloadScreen(),
          
        ]),
      ),
    );
  }
}