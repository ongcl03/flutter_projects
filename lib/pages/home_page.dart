import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/constants.dart';
import 'package:flutter_projects/pages/components/app_bar_title.dart';
import 'package:flutter_projects/pages/components/categories.dart';
import 'package:flutter_projects/pages/components/Bottom%20Navigation%20Bar/my_bottom_navigation_bar.dart';
import 'package:flutter_projects/pages/components/gridview_posts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildAppBar(),
      body: Column(
        children: [
          Categories(),
          const GridViewPosts(),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }


  AppBar buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.play_circle_outline,
            size: 28,
            color: textColor,
          )),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          AppBarTitle(
            text: "关注",
            selectedIndex: 1,
          ),
          AppBarTitle(
            text: "发现",
            selectedIndex: 2,
          ),
          AppBarTitle(
            text: "附近",
            selectedIndex: 3,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: textColor, size: 28),
          ),
        )
      ],
    );
  }
}

