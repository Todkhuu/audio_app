import 'package:audio_app_2/managers/country_manager.dart';
import 'package:audio_app_2/models/country.dart';
import 'package:audio_app_2/screens/player/widgets/lessons_bottom_sheet/sheet_close_button.dart';
import 'package:audio_app_2/screens/player/widgets/lessons_bottom_sheet/sheet_handle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryPickerSheet extends StatelessWidget {
  final void Function(Country) onSelect;

  const CountryPickerSheet({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final countryManager = context.watch<CountryManager>();

    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 15,
                  right: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    SheetHandle(),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Улсын нэрээр хайх",
                        hintStyle: TextStyle(
                          color: Color(0xFFA9B0BB),
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(Icons.search_outlined, size: 18),
                        prefixIconColor: Color(0xFF33547D),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xFFe8eaeb),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xFFe8eaeb),
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        countryManager.setQuery(value);
                      },
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.separated(
                  itemCount: countryManager.filteredCountries.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Color(0xFFe8eaeb),
                    height: 1,
                    thickness: 1,
                  ),
                  itemBuilder: (context, index) {
                    final country = countryManager.filteredCountries[index];
                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      leading: Image.asset(country.flag, width: 28, height: 20),
                      title: Text(
                        country.name,
                        style: TextStyle(
                          color: countryManager.selected == country
                              ? Color(0xFF33547D)
                              : Color(0xFFA9B0BB),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            country.dialCode,
                            style: TextStyle(
                              color: countryManager.selected == country
                                  ? Color(0xFF33547D)
                                  : Color(0xFFA9B0BB),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (countryManager.selected == country)
                            const SizedBox(width: 15),
                          if (countryManager.selected == country)
                            Image.asset(
                              'assets/images/auth/arrow_west.png',
                              width: 16,
                              height: 16,
                            ),
                        ],
                      ),
                      onTap: () {
                        countryManager.selectCountry(country);
                        onSelect(country);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(top: -5, right: 8, child: SheetCloseButton()),
        ],
      ),
    );
  }
}
