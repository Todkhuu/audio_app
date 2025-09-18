import 'package:flutter/cupertino.dart';

class PickerColumn extends StatelessWidget {
  final int itemCount;
  final int initialItem;
  final Function(int) onSelectedItemChanged;
  final String Function(int) displayText;
  final int Function() currentSelected;

  const PickerColumn({
    super.key,
    required this.itemCount,
    required this.initialItem,
    required this.onSelectedItemChanged,
    required this.displayText,
    required this.currentSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 32,
      scrollController: FixedExtentScrollController(initialItem: initialItem),
      onSelectedItemChanged: onSelectedItemChanged,
      children: List.generate(itemCount, (index) {
        final isSelected = currentSelected() == index;
        return Center(
          child: Text(
            displayText(index),
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF33547D),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        );
      }),
    );
  }
}
