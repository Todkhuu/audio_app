import 'package:audio_app_2/screens/category/widgets/category_chip_widget.dart';
import 'package:audio_app_2/managers/categories_controller.dart';
import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key, required this.controller});
  final CategoriesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categoryNames.length,
                itemBuilder: (context, index) {
                  final category = controller.categoryNames[index];
                  return Container(
                    margin: EdgeInsets.only(left: index == 0 ? 20 : 10),
                    child: CategoryChipWidget(
                      categoryName: category,
                      isSelected: controller.isSelected(category),
                      lessonCount: controller.getLessonCount(category),
                      onTap: () {
                        controller.selectCategory(category);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
