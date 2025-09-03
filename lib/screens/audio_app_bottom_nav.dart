import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/screens/downloaded_lessons_page.dart';
import 'package:flutter/material.dart';

class AudioAppBottomNav extends StatefulWidget {
  const AudioAppBottomNav({super.key});

  @override
  State<AudioAppBottomNav> createState() => _AudioAppBottomNavState();
}

class _AudioAppBottomNavState extends State<AudioAppBottomNav> {
  int _selectedIndex = 0;
  final PageManager pageManager = PageManager();

  final List<AudioLesson> lessons = [
    AudioLesson(
      title: "Бясалгал 1",
      lessonNumber: "Хичээл 1",
      startTime: "06:00",
      duration: Duration.zero,
      audioPath: 'assets/audio/good.mp3',
      lessonDescription: 'Орой 18 цагаас давтаж хийнэ.',
    ),
    AudioLesson(
      title: "Бясалгал 2",
      lessonNumber: "Хичээл 2",
      startTime: "07:00",
      duration: Duration.zero,
      audioPath: 'assets/audio/study.mp3',
      lessonDescription: 'Еглее 04 цагт хийнэ.',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      // Home Page
      ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return ListTile(
            title: Text(lesson.title),
            subtitle: Text(lesson.lessonNumber),
            trailing: IconButton(
              icon: const Icon(Icons.download),
              onPressed: () async {
                await pageManager.downloadAndPlay(lesson);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${lesson.title} татагдлаа")),
                );
              },
            ),
          );
        },
      ),

      // Downloads Page
      DownloadedLessonsPage(pageManager: pageManager),

      // Profile Page
      const Center(child: Text("👤 Profile")),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: "Downloads",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
