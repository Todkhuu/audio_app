import 'package:audio_app_2/screens/player_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Downloader',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const PlayerScreen(),
    );
  }
}
