import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/components/search_bar.dart';
import 'package:flutter_projects/components/song_tab_bar.dart';
import 'package:flutter_projects/components/song_tile.dart';
import 'package:flutter_projects/constants/constant.dart';
import 'package:flutter_projects/models/song.dart';
import 'package:flutter_projects/services/firestore/ReadData.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> tabs = ["English songs", "Chinese songs"];

  // No song at start
  Song currentSong = Song(songName: "Choose your song", artist: "My Playlist", songUrl: "", imageUrl: "https://png.pngtree.com/element_our/png/20181022/music-and-live-music-logo-with-neon-light-effect-vector-png_199406.jpg");

  // Audio Player
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllSongs();
  }

  // Read data from firestore and get all the songs when the app start and to build the listview
  Future getAllSongs() async{
    final ReadData readData = ReadData();
    await readData.getEnglishSong();
    await readData.getChineseSong();
  }


  // Song duration
  Duration duration = const Duration();
  Duration position = const Duration();


  Future playMusic(String songUrl) async{

    // A song is playing but new song is selected
    if(isPlaying && currentSong.songUrl != songUrl){
      player.pause();
      await player.play(UrlSource(songUrl));
      isPlaying = true;
    }

    else if(isPlaying && currentSong.songUrl == songUrl){
      await player.stop();
      await player.play(UrlSource(songUrl));
    }

    else{
      setState(() {
        isPlaying = true;
      });
      await player.play(UrlSource(songUrl));
    }

    // Use these two method below to build the progress bar of song

    // This event returns the duration of the file, when it's available (it might take a while because it's being downloaded or buffered).
    // So here we have the total length of the song
    player.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    // This Event updates the current position of the audio. You can use it to make a progress bar
    // So here we have the current position of the song
    player.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: buildAppBar(),
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
            const SearchBar(),

            const SizedBox(
              height: 25,
            ),

            // Tab Bar
            SongTabBar(tabs: tabs),

            // Tab Bar View
            buildTabBarView(),

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
                      value: position.inSeconds.toDouble(),
                      min: 0.0,
                      max: duration.inSeconds.toDouble(),
                      onChanged: (newValue) async{
                        setState(() {
                          position = Duration(seconds: newValue.toInt());
                        });
                        await player.seek(Duration(seconds: newValue.toInt()));
                      },
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.brown[900],
                      activeColor: Colors.brown[900],

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
                            onPressed: (){
                              if(isPlaying){
                                player.pause();
                                setState(() {
                                  isPlaying = false;
                                });
                              }
                              else{
                                player.resume();
                                setState(() {
                                  isPlaying = true;
                                });
                              }
                            },
                            icon: isPlaying ? const Icon(Icons.pause, size: 40, color: Colors.black,) : const Icon(Icons.play_arrow, size: 40, color: Colors.black,)
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

  Expanded buildTabBarView() {
    return Expanded(
            child: TabBarView(
              children: [

                // English song list view
               StreamBuilder<Object>(
                 stream: null,
                 builder: (context, snapshot) {
                   return ListView.builder(
                     itemCount: englishSongList.length,
                     itemBuilder: (context, index){
                       return SongTile(song: englishSongList[index],
                         onTap: (){
                           setState(() {
                             currentSong = englishSongList[index];
                           });
                           playMusic(currentSong.songUrl);
                         }
                       );
                     },
                   );
                 }
               ),


                // Chinese song list view
                ListView.builder(
                  itemCount: chineseSongList.length,
                  itemBuilder: (context, index){
                    return SongTile(song: chineseSongList[index],
                        onTap: (){
                          setState(() {
                            currentSong = chineseSongList[index];
                          });
                          playMusic(currentSong.songUrl);
                        }
                    );
                  },
                ),

              ],
            ),
          );
  }

  AppBar buildAppBar() {
    return AppBar(
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



