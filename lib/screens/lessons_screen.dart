import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('a')));
  }
}
