import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryManager extends ChangeNotifier {
  final List<Country> countries = const [
    Country(
      name: "Монгол",
      dialCode: "+976",
      flag: "assets/images/flag/MN.png",
    ),
    // Country(name: "АНУ", dialCode: "+1", flag: "assets/images/flag/usa.png"),
    Country(
      name: "Афганистан",
      dialCode: "+93",
      flag: "assets/images/flag/AF.png",
    ),
    Country(name: "Аланд", dialCode: "+358", flag: "assets/images/flag/IS.png"),
    Country(
      name: "Албани",
      dialCode: "+355",
      flag: "assets/images/flag/AL.png",
    ),
    Country(name: "Алжир", dialCode: "+213", flag: "assets/images/flag/DZ.png"),
    Country(
      name: "Америкийн Самоа",
      dialCode: "+1684",
      flag: "assets/images/flag/AN.png",
    ),
    Country(
      name: "Андорра",
      dialCode: "+376",
      flag: "assets/images/flag/AO.png",
    ),
    Country(name: "Ангол", dialCode: "+244", flag: "assets/images/flag/AR.png"),
  ];

  Country _selected = const Country(
    name: "Монгол",
    dialCode: "+976",
    flag: "assets/images/flag/MN.png",
  );

  String _query = "";

  Country get selected => _selected;
  String get query => _query;

  List<Country> get filteredCountries {
    if (_query.isEmpty) return countries;
    return countries.where((c) {
      return c.name.toLowerCase().contains(_query.toLowerCase()) ||
          c.dialCode.contains(_query);
    }).toList();
  }

  void selectCountry(Country country) {
    _selected = country;
    notifyListeners();
  }

  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }
}
