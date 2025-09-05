import 'package:audio_app_2/managers/auth_manager.dart';
import 'package:audio_app_2/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthManager())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Downloader',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFf2f5f7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent, // Энэ нь чухал!
          elevation: 1,
        ),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

// const AudioAppBottomNav()
