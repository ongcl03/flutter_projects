import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/bottom_nav_bar.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  static const routeName = '/discover';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(index: 1,),
    );
  }
}
