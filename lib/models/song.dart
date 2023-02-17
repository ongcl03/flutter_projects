class Song {
  final String songName;
  final String artist;
  final String songUrl;
  final String imageUrl;

  Song(
      {required this.songName,
      required this.artist,
      required this.songUrl,
      required this.imageUrl});
}

List<Song> songList = [
  Song(
      songName: "Life is a Dream",
      artist: "Michael Ramir C.",
      songUrl:
          "https://assets.mixkit.co/music/preview/mixkit-life-is-a-dream-837.mp3",
      imageUrl:
          "https://images.unsplash.com/photo-1514489024785-d5ba8dfb2198?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80"
  ),
  Song(
      songName: "A Very Happy Christmas day",
      artist: "Michael Ramir C.",
      songUrl:
      "https://assets.mixkit.co/music/preview/mixkit-a-very-happy-christmas-897.mp3",
      imageUrl:
      "https://images.pexels.com/photos/4215109/pexels-photo-4215109.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ),
  Song(
      songName: "Feeling Happy",
      artist: "Michael Ramir C.",
      songUrl:
      "https://assets.mixkit.co/music/preview/mixkit-feeling-happy-5.mp3",
      imageUrl:
      "https://images.pexels.com/photos/2583494/pexels-photo-2583494.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ),


];
