import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final Map<String, String> _users = {};
  String? _currentUser;

  bool get isAuthenticated => _currentUser != null;

  Future<void> login(String email, String password) async {
    if (_users.containsKey(email) && _users[email] == password) {
      _currentUser = email;
      notifyListeners();
    } else {
      throw Exception('Invalid email or password');
    }
  }

  Future<void> signUp(String email, String password) async {
    if (_users.containsKey(email)) {
      throw Exception('User already exists');
    } else {
      _users[email] = password;
      notifyListeners();
    }
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
