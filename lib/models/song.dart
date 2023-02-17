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

Song mySong = Song(
    songName: "Life is a Dream",
    artist: "by Michael Ramir C.",
    songUrl: "https://assets.mixkit.co/music/preview/mixkit-life-is-a-dream-837.mp3",
    imageUrl: "https://images.unsplash.com/photo-1514489024785-d5ba8dfb2198?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80"
);
