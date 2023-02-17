import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SongTabBar extends StatelessWidget {
  const SongTabBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
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
    );
  }
}