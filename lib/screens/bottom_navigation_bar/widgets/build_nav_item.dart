import 'package:flutter/material.dart';

BottomNavigationBarItem buildNavItem(
  String iconPath,
  bool isSelected,
  String label,
) {
  return BottomNavigationBarItem(
    icon: ColorFiltered(
      colorFilter: isSelected
          ? const ColorFilter.mode(Color(0xFF33547D), BlendMode.srcIn)
          : const ColorFilter.mode(Color(0xFFCAD0D7), BlendMode.srcIn),
      child: Image.asset(iconPath, width: 24, height: 24),
    ),
    label: label,
  );
}
