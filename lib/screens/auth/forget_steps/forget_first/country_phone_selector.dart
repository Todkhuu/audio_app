import 'package:audio_app_2/managers/country_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'country_picker_sheet.dart';

class CountryPhoneSelector extends StatelessWidget {
  const CountryPhoneSelector({super.key});

  void _openPicker(BuildContext context, CountryManager manager) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return ChangeNotifierProvider.value(
          value: context.read<CountryManager>(),

          child: CountryPickerSheet(
            onSelect: (country) {
              print("Сонгосон улс: ${country.name}");
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final manager = context.watch<CountryManager>();

    return GestureDetector(
      onTap: () => _openPicker(context, manager),
      child: Row(
        children: [
          Image.asset(manager.selected.flag, width: 28, height: 20),
          const SizedBox(width: 6),
          Text(
            manager.selected.dialCode,
            style: TextStyle(color: Color(0xFF33547D)),
          ),
          const SizedBox(width: 6),
          Image.asset('assets/images/auth/dropdown.png', width: 10),
        ],
      ),
    );
  }
}
