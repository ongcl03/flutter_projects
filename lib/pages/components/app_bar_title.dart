import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/constants.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key, required this.text, required this.selectedIndex}) : super(key: key);

  final String text;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Column(
        children: [
          Text(text, style: const TextStyle(color: textColor, fontSize: 18),),
          Container(
            color: selectedIndex == 2? Colors.red : Colors.transparent,
            height: 3,
            width: 28,
          ),
        ],
      ),
    );
  }
}


