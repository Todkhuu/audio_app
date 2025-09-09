// widgets/lessons_empty_state_widget.dart
import 'package:flutter/material.dart';

class LessonsEmptyStateWidget extends StatelessWidget {
  const LessonsEmptyStateWidget({super.key, this.categoryName});

  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.library_books_outlined,
            size: 80,
            color: const Color(0xFFCAD0D7),
          ),
          const SizedBox(height: 20),
          Text(
            _getEmptyMessage(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF33547D),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _getEmptySubtitle(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFA9B0BB),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 32),
          _buildActionButton(context),
        ],
      ),
    );
  }

  String _getEmptyMessage() {
    if (categoryName == null || categoryName == 'Бүгд') {
      return 'Сургалт олдсонгүй';
    }
    return '"$categoryName" \nкатегорид сургалт байхгүй';
  }

  String _getEmptySubtitle() {
    if (categoryName == null || categoryName == 'Бүгд') {
      return 'Одоогоор ямар ч сургалт байхгүй байна';
    }
    return 'Энэ категорид сургалт нэмэгдээгүй байна';
  }

  Widget _buildActionButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Home page рүү буцах эсвэл бүх категори харуулах
        Navigator.pop(context);
      },
      icon: const Icon(Icons.refresh, size: 18, color: Colors.white),
      label: const Text(
        'Дахин оролдох',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF33547D),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 2,
      ),
    );
  }
}
