import 'package:flutter/material.dart';
import 'package:spider_tech/Screens/reels_screen.dart';

void main() {
  runApp(const ReelsApp());
}

class ReelsApp extends StatelessWidget {
  const ReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const ReelsScreen(),
    );
  }
}
