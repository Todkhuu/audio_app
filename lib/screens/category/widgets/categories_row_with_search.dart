import 'package:audio_app_2/managers/categories_controller.dart';
import 'package:audio_app_2/screens/category/widgets/category_chip_widget.dart';
import 'package:flutter/material.dart';

class CategoriesRowWithSearch extends StatefulWidget {
  final CategoriesController controller;
  const CategoriesRowWithSearch({super.key, required this.controller});

  @override
  State<CategoriesRowWithSearch> createState() =>
      _CategoriesRowWithSearchState();
}

class _CategoriesRowWithSearchState extends State<CategoriesRowWithSearch> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final searchWidth = _isSearching ? screenWidth - 180.0 : 0.0;

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/category/search.png',
                width: 18,

                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(width: 10),
          // Animated search input
          Padding(
            padding: EdgeInsets.only(right: _isSearching ? 10.0 : 0.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: searchWidth,
              height: 35,
              curve: Curves.easeInOut,
              child: _isSearching
                  ? TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Хичээлийн нэрээр хайх",
                        hintStyle: TextStyle(
                          color: Color(0xFFA9B0BB),
                          fontSize: 12,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        widget.controller.filterCategory(value);
                      },
                    )
                  : null,
            ),
          ),
          // Chips row
          Expanded(
            child: SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.controller.categoryNames.length,
                itemBuilder: (context, index) {
                  final category = widget.controller.categoryNames[index];
                  return Container(
                    margin: EdgeInsets.only(left: index == 0 ? 0 : 10),
                    child: CategoryChipWidget(
                      categoryName: category,
                      isSelected: widget.controller.isSelected(category),
                      lessonCount: widget.controller.getLessonCount(category),
                      onTap: () {
                        widget.controller.selectCategory(category);
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
