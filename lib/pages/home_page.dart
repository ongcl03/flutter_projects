import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_projects/components/song_tile.dart';
import 'package:flutter_projects/constants/constant.dart';
import 'package:flutter_projects/models/song.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_projects/models/song.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> tabs = ["English songs", "Chinese songs"];

  // No song at start
  Song currentSong = Song(songName: "", artist: "", songUrl: "", imageUrl: "");

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    )),
                  )
                  .toList(),
            ),

            // Tab Bar View
            Expanded(
              child: TabBarView(
                children: [

                  // English song list view
                 ListView.builder(
                   itemCount: songList.length,
                   itemBuilder: (context, index){
                     return SongTile(song: songList[index],
                       onTap: (){
                         setState(() {
                           currentSong = songList[index];
                         });
                       }
                     );
                   },
                 ),


                  // Chinese song list view
                  ListView(
                    children: [

                    ],
                  ),

                ],
              ),
            ),

            // Bottom player
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Color(0x55212121),
                  blurRadius: 8.0
                )]
                ),
              child: Column(
                children: [
                  // Slider
                  Slider.adaptive(
                      value: 0.0,
                      onChanged: (value){},
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.brown[900],
                  ),

                  // Player
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 8.0, right: 8.0, bottom: 12.0),

                        //The song image
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(currentSong.imageUrl),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),

                      // To fix text overflow of song name in the right, use this expanded widget
                      Expanded(
                        // The song name text and author text
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentSong.songName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                            const SizedBox(height: 5,),
                            Text(currentSong.artist, style: TextStyle(color: Colors.grey.shade600, fontSize: 15.5),)
                          ],
                        ),
                      ),

                      // The play button
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 20),
                        child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.play_arrow, size: 40,)
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
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
