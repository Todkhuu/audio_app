import 'package:audio_app_2/screens/lesson/tabs/description_tab.dart';
import 'package:audio_app_2/screens/lesson/tabs/enrollment_tab.dart';
import 'package:audio_app_2/screens/lesson/tabs/program_tab.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:flutter/material.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({
    super.key,
    required this.pageManager,
    required this.lesson,
  });
  final PageManager pageManager;
  final AudioLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f5f7),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      'assets/images/left.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Text(
                    lesson.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 18.54 / 16,
                      color: Color(0xFF33547D),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              // Image
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    lesson.bgImage,
                    height: 195,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 35,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 4.5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/bg/star.png', width: 12),
                      const SizedBox(width: 2),
                      Text(
                        lesson.rate.toString(),
                        style: const TextStyle(
                          color: Color(0xFFF5B945),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Container
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.only(
                left: 15,
                top: 15,
                right: 15,
                bottom: 35,
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F6F8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: 40,
                        child: TabBar(
                          labelColor: Color(0xFF33547D),
                          unselectedLabelColor: Color(0xFFCAD0D7),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            height: 25 / 14,
                          ),
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorPadding: EdgeInsets.zero,
                          indicatorColor: Colors.transparent,
                          indicatorWeight: 0,
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(text: "Элсэлт"),
                            Tab(text: "Хөтөлбөр"),
                            Tab(text: "Тайлбар"),
                          ],
                        ),
                      ),
                    ),

                    // Tab контент
                    Expanded(
                      child: TabBarView(
                        children: [
                          EnrollmentTab(
                            lesson: lesson,
                            pageManager: pageManager,
                          ),
                          ProgramTab(lesson: lesson, pageManager: pageManager),
                          DescriptionTab(lesson: lesson),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
