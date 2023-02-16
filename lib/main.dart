import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/article_page.dart';
import 'package:flutter_projects/pages/discover_page.dart';
import 'package:flutter_projects/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        HomePage.routeName : (context) => const HomePage(),
        DiscoverPage.routeName : (context) => const DiscoverPage(),
        ArticlePage.routeName : (context) => const ArticlePage()
      },
    );
  }
}
















