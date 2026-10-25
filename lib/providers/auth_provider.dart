import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  // Базовая валидация email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Введите корректный email';
    }
    return null;
  }

  // Валидация пароля (минимум 6 символов)
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите пароль';
    }
    if (value.length < 6) {
      return 'Пароль должен быть не менее 6 символов';
    }
    return null;
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    
    // Имитация сетевого запроса
    await Future.delayed(const Duration(seconds: 1));
    
    if (email == 'test@candy.ru' && password == '123456') {
      _currentUser = User(id: 'u1', name: 'Кондитер', email: email);
    } else {
      throw Exception('Неверный логин или пароль');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    _currentUser = User(id: 'u2', name: name, email: email);

    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}