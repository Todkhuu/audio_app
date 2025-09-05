import 'dart:math';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthManager extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String? _errorMessage;
  bool _dontShowAgain = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get dontShowAgain => _dontShowAgain;

  User? _user;
  User? get user => _user;

  String? _sentCode;

  set dontShowAgain(bool value) {
    _dontShowAgain = value;
    notifyListeners();
  }

  // 4 оронтой код илгээх simulation (signup-д)
  Future<void> sendCode(String phone) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    _sentCode = (1000 + Random().nextInt(9000)).toString();
    print("Simulation: sent code $_sentCode to $phone");

    _isLoading = false;
    notifyListeners();
  }

  Future<void> signupVerify(String phone, String code) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    if (_sentCode == code) {
      _user = User(identifier: phone, password: '', code: code);
      _isLoggedIn = true;
    } else {
      _errorMessage = "Код буруу байна";
      _isLoggedIn = false;
    }

    _isLoading = false;
    notifyListeners();
  }

  // Login simulation
  Future<void> login(String identifier, String password) async {
    _isLoading = true;
    _errorMessage = null;
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
