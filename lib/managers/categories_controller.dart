import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';

class CategoriesController extends ChangeNotifier {
  final PageManager pageManager;

  String? _selectedCategory;
  List<AudioLesson> _filteredLessons = [];
  Map<String, List<AudioLesson>> _allCategories = {};
  List<AudioLesson> _searchResults = [];

  CategoriesController({required this.pageManager, String? initialCategory}) {
    _selectedCategory = initialCategory;
    _loadData();
    _updateFilteredLessons();

    pageManager.assetsLessonsNotifier.addListener(_onLessonsChanged);
    pageManager.downloadedLessonsNotifier.addListener(_onLessonsChanged);
  }

  // Getters
  String? get selectedCategory => _selectedCategory;
  List<AudioLesson> get filteredLessons => _filteredLessons;
  Map<String, List<AudioLesson>> get allCategories => _allCategories;
  List<AudioLesson> get searchResults => _searchResults;
  List<String> get categoryNames => ['Бүгд', ..._allCategories.keys.toList()];
  bool get hasLessons => _filteredLessons.isNotEmpty;

  // Category selection
  void selectCategory(String? categoryName) {
    _selectedCategory = categoryName == 'Бүгд' ? 'Бүгд' : categoryName;
    _updateFilteredLessons();
    notifyListeners();
  }

  bool isSelected(String categoryName) {
    return (categoryName == 'Бүгд' &&
            (_selectedCategory == null || _selectedCategory == 'Бүгд')) ||
        categoryName == _selectedCategory;
  }

  int getLessonCount(String categoryName) {
    if (categoryName == 'Бүгд') {
      return pageManager.assetsLessonsNotifier.value.length +
          pageManager.downloadedLessonsNotifier.value.length;
    }
    return _allCategories[categoryName]?.length ?? 0;
  }

  // Private methods
  void _loadData() {
    _allCategories = pageManager.getLessonsByCategory();
  }

  void _updateFilteredLessons() {
    if (_selectedCategory == null || _selectedCategory == 'Бүгд') {
      _filteredLessons = [
        ...pageManager.assetsLessonsNotifier.value,
        ...pageManager.downloadedLessonsNotifier.value,
      ];
    } else {
      _filteredLessons = _allCategories[_selectedCategory] ?? [];
    }
  }

  void _onLessonsChanged() {
    _loadData();
    _updateFilteredLessons();
    notifyListeners();
  }

  @override
  void dispose() {
    pageManager.assetsLessonsNotifier.removeListener(_onLessonsChanged);
    pageManager.downloadedLessonsNotifier.removeListener(_onLessonsChanged);
    super.dispose();
  }
}


  // Search
  // void searchLessons(String query) {
  //   final lower = query.toLowerCase().trim();
  //   if (lower.isEmpty) {
  //     _searchResults.clear();
  //     notifyListeners();
  //     return;
  //   }

  //   final allLessons = [
  //     ...pageManager.assetsLessonsNotifier.value,
  //     ...pageManager.downloadedLessonsNotifier.value,
  //   ];

  //   _searchResults = allLessons.where((lesson) {
  //     return lesson.title.toLowerCase().contains(lower) ||
  //         lesson.category.toLowerCase().contains(lower) ||
  //         lesson.lessonDescription.toLowerCase().contains(lower);
  //   }).toList();

  //   notifyListeners();
  // }