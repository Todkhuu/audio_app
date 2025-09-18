import 'dart:math';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthManager extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = false;
  bool _dontShowAgain = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  bool get dontShowAgain => _dontShowAgain;

  User? _user;
  User? get user => _user;

  String? _sentCode;

  set dontShowAgain(bool value) {
    _dontShowAgain = value;
    notifyListeners();
  }

  // Mock хэрэглэгчид
  final List<User> mockUsers = [
    User(
      name: 'Бадамгарав',
      email: 'badamgarav@example.com',
      phone: '12312312',
      phones: '+97699123456',
      birthDate: DateTime(1995, 5, 12),
      identifier: 'badamgarav@example.com',
      password: '123123',
      code: '',
    ),
    User(
      name: 'Солонго',
      email: 'solongo@example.com',
      phone: '+97699234567',
      birthDate: DateTime(1998, 8, 21),
      identifier: 'solongo@example.com',
      password: 'abcdef',
      code: '',
    ),
  ];

  // 4 оронтой код илгээх simulation (signup-д)
  Future<void> sendCode(String phone) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    _sentCode = (1000 + Random().nextInt(9000)).toString();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> signupVerify(String phone, String code) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    if (_sentCode == code) {
      _user = User(identifier: phone, password: '', code: code);
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }

    _isLoading = false;
    notifyListeners();
  }

  // Login simulation
  Future<void> login(String identifier, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    _user = User(identifier: identifier, password: password, code: '');
    _isLoggedIn = true;

    _isLoading = false;
    notifyListeners();
  }

  // FaceID simulation
  Future<void> loginWithFaceID() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    _user = User(identifier: "faceid_user", password: '', code: '');
    _isLoggedIn = true;

    _isLoading = false;
    notifyListeners();
  }

  // Facebook simulation (signup)
  Future<void> signupWithFacebook() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    _user = User(identifier: "facebook_user", password: '', code: '');
    _isLoggedIn = true;

    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _user = null;
    _isLoggedIn = false;
    _sentCode = null;
    notifyListeners();
  }
}
