import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/song.dart';

// By default the list is empty, after getting data, all the sons will add to the list respectively
// These two lists are used to build the ListView widget in the home page
List<Song> englishSongList = [];
List<Song> chineseSongList = [];


class ReadData {

  // Get all the documents (english songs) inside the English Songs collection and add to the chinese song list
  static Future getEnglishSong() async{
    await FirebaseFirestore.instance.collection("English Songs").get().then((value) {
      for(var songFields in value.docs) {

        englishSongList.add(
            Song(
                songName: songFields.data()['songName'],
                artist: songFields.data()['artist'],
                songUrl: songFields.data()['songUrl'],
                imageUrl: songFields.data()['imageUrl']
            )
        );
      }
      print(englishSongList);
    });
  }


  // Get all the documents (chinese songs) inside the Chinese Songs collection and add to the chinese song list
  static Future getChineseSong() async{
    await FirebaseFirestore.instance.collection("Chinese Songs").get().then((value) {
      for(var songFields in value.docs) {

        chineseSongList.add(
            Song(
                songName: songFields.data()['songName'],
                artist: songFields.data()['artist'],
                songUrl: songFields.data()['songUrl'],
                imageUrl: songFields.data()['imageUrl']
            )
        );
      }
      print(chineseSongList);
    });
  }
}
