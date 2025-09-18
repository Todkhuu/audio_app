import 'package:audio_app_2/screens/fix_profile/widgets/confirm_button.dart';
import 'package:audio_app_2/screens/fix_profile/widgets/picker_column.dart';
import 'package:audio_app_2/screens/fix_profile/widgets/picker_header.dart';
import 'package:audio_app_2/screens/fix_profile/widgets/title_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const BirthDatePicker({
    super.key,
    this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<BirthDatePicker> createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends State<BirthDatePicker> {
  late int selectedDay;
  late int selectedMonth;
  late int selectedYear;

  @override
  void initState() {
    super.initState();
    final initDate = widget.initialDate ?? DateTime(2000, 1, 1);
    selectedDay = initDate.day;
    selectedMonth = initDate.month;
    selectedYear = initDate.year;
  }

  int currentSelectedDay = 0;
  int currentSelectedMonth = 0;
  int currentSelectedYear = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 35),
      height: 375,
      child: Column(
        children: [
          const PickerHeader(),
          const SizedBox(height: 10),
          const TitleLabel(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PickerColumn(
                    itemCount: 31,
                    initialItem: selectedDay - 1,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        currentSelectedDay = value;
                        selectedDay = value + 1;
                      });
                    },
                    displayText: (index) => "${index + 1}".padLeft(2, '0'),
                    currentSelected: () => currentSelectedDay,
                  ),
                ),
                Expanded(
                  child: PickerColumn(
                    itemCount: 12,
                    initialItem: selectedMonth - 1,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        currentSelectedMonth = value;
                        selectedMonth = value + 1;
                      });
                    },
                    displayText: (index) => "${index + 1}".padLeft(2, '0'),
                    currentSelected: () => currentSelectedMonth,
                  ),
                ),
                Expanded(
                  child: PickerColumn(
                    itemCount: 150,
                    initialItem: (selectedYear - 1900).clamp(0, 149),
                    onSelectedItemChanged: (value) {
                      setState(() {
                        currentSelectedYear = value;
                        selectedYear = 1900 + value;
                      });
                    },
                    displayText: (index) => "${1900 + index}",
                    currentSelected: () => currentSelectedYear,
                  ),
                ),
              ],
            ),
          ),
          ConfirmButton(
            onPressed: () {
              final birthDate = DateTime(
                selectedYear,
                selectedMonth,
                selectedDay,
              );
              widget.onDateSelected(birthDate);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
