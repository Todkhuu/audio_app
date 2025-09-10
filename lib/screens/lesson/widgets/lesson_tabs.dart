import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/lesson/tabs/description_tab.dart';
import 'package:audio_app_2/screens/lesson/tabs/enrollment_tab.dart';
import 'package:audio_app_2/screens/lesson/tabs/program_tab.dart';
import 'package:flutter/material.dart';

class LessonTabs extends StatelessWidget {
  const LessonTabs({
    super.key,
    required this.lesson,
    required this.pageManager,
  });

  final AudioLesson lesson;
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
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
                  color: const Color(0xFFF4F6F8),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(5),
                child: const SizedBox(
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
                    EnrollmentTab(lesson: lesson, pageManager: pageManager),
                    ProgramTab(lesson: lesson, pageManager: pageManager),
                    DescriptionTab(lesson: lesson),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
