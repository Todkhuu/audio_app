import 'package:audio_app_2/screens/audio_app_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Downloader',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent, // Энэ нь чухал!
          elevation: 1,
        ),

        textTheme: GoogleFonts.geologicaTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: const AudioAppBottomNav(),
    );
  }
}
