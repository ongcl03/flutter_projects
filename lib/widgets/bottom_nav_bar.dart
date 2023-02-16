import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/article_page.dart';
import 'package:flutter_projects/pages/discover_page.dart';
import 'package:flutter_projects/pages/home_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.index
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(left: 50),
              child: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, HomePage.routeName);
                },
                icon: const Icon(Icons.home),
              ),
            ),
            label: 'Home'
        ),

        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: (){
                Navigator.pushNamed(context, DiscoverPage.routeName);
              },
              icon: const Icon(Icons.search),
            ),
            label: 'Search'
        ),

        BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(right: 50),
              child: IconButton(
                onPressed: (){
                  debugPrint('No profile page');
                },
                icon: const Icon(Icons.person),
              ),
            ),
            label: 'profile'
        ),
      ],
    );
  }
}