import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/screens/category/widgets/categories_row.dart';
import 'package:audio_app_2/screens/category/widgets/lessons_list.dart';
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/managers/categories_controller.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.pageManager,
    this.initialCategory,
  });

  final PageManager pageManager;
  final String? initialCategory;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  late CategoriesController controller;

  @override
  void initState() {
    super.initState();
    controller = CategoriesController(
      pageManager: widget.pageManager,
      initialCategory: widget.initialCategory,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f5f7),
      appBar: ScreensHeader(text: 'Сургалтууд'),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return Column(
            children: [
              CategoriesRow(controller: controller),
              Expanded(
                child: LessonsList(
                  controller: controller,
                  pageManager: widget.pageManager,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
