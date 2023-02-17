import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> tabs = ["English songs", "Chinese songs"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),

            // My Playlist Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("My Playlist",
                  style: GoogleFonts.bebasNeue(fontSize: 50)),
            ),

            // The slow and reverb... text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "The slow and reverb song you are looking for",
                style: TextStyle(fontSize: 16, color: lightTextColor),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)))),
            ),

            const SizedBox(
              height: 25,
            ),

            // Tab Bar
            TabBar(
              indicatorColor: Colors.black38,
              tabs: tabs
                  .map(
                    (tab) => Tab(
                        child: Text(
                      tab,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      )
                    )),
                  )
                  .toList(),
            )

            // Tab Bar View
          ],
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ""
          )
        ],
      );
  }
}
