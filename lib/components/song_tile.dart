import 'package:flutter/material.dart';
import 'package:flutter_projects/models/song.dart';
import 'package:google_fonts/google_fonts.dart';


class SongTile extends StatelessWidget {
  const SongTile({Key? key, required this.song, required this.onTap}) : super(key: key);

  final Song song;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(song.imageUrl),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            const SizedBox(width: 20,),

            // To fix text overflow of song name in the right, use this expanded widget
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(song.songName, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 5,),
                  Text(song.artist, style: TextStyle(color: Colors.grey.shade600, fontSize: 16),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
