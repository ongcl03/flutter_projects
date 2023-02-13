import 'package:flutter/material.dart';
import 'package:flutter_projects/constants.dart';
import 'package:flutter_projects/screens/home/components/body.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: (){},
      ),
      actions: [
        IconButton(
          // Default color is white
            onPressed: (){},
            icon: SvgPicture.asset("assets/icons/search.svg", color: kTextColor,)
        ),
        IconButton(
            // Default color is white
            onPressed: (){},
            icon: SvgPicture.asset("assets/icons/cart.svg", color: kTextColor,)
        ),
        const SizedBox(width: kDefaultPaddin / 2,)
      ],
    );
  }
}















