import 'package:flutter/material.dart';
import 'package:flutter_projects/constants.dart';
import 'package:flutter_projects/screens/home/home_screen.dart';

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
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor)
      ),
      home: const HomeScreen()
    );
  }
}
