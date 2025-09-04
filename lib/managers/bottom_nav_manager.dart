import 'package:flutter/material.dart';

class BottomNavManager {
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  void dispose() {
    selectedIndex.dispose();
  }
}
