import 'dart:convert';

import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DownloadedLessonsPage extends StatefulWidget {
  final PageManager pageManager;
  const DownloadedLessonsPage({super.key, required this.pageManager});

  @override
  State<DownloadedLessonsPage> createState() => _DownloadedLessonsPageState();
}

class _DownloadedLessonsPageState extends State<DownloadedLessonsPage> {
  List<AudioLesson> _downloaded = [];

  @override
  void initState() {
    super.initState();
    _loadDownloads();
  }

  Future<void> _loadDownloads() async {
    final prefs = await SharedPreferences.getInstance();
    final downloads = prefs.getStringList('downloads') ?? [];

    final lessons = downloads.map((d) {
      final map = jsonDecode(d);
      return AudioLesson(
        title: map['title'],
        lessonNumber: map['lessonNumber'],
        startTime: map['startTime'],
        duration: Duration(seconds: map['duration']),
        audioPath: map['audioPath'],
        lessonDescription: map['lessonDescription'],
        isLiked: map['isLiked'],
      );
    }).toList();

    setState(() => _downloaded = lessons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Downloaded Lessons")),
      body: _downloaded.isEmpty
          ? const Center(child: Text("Татсан аудио алга байна."))
          : ListView.builder(
              itemCount: _downloaded.length,
              itemBuilder: (context, index) {
                final lesson = _downloaded[index];
                return ListTile(
                  title: Text(lesson.title),
                  subtitle: Text(lesson.lessonNumber),
                  trailing: IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () async {
                      await widget.pageManager.downloadAndPlay(lesson);
                    },
                  ),
                );
              },
            ),
    );
  }
}
