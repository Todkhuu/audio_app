// pages/home_page.dart
import 'package:audio_app_2/components/home_page/custom_app_bar.dart';
import 'package:audio_app_2/components/home_page/lessons_section.dart';
import 'package:audio_app_2/components/home_page/quote_section.dart';
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F4F2),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const QuoteSection(),
            LessonsSection(pageManager: pageManager),
          ],
        ),
      ),
    );
  }
}
