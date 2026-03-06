import 'package:flutter/foundation.dart';
import 'package:medvault/models/app_user.dart';
import 'package:medvault/services/auth_service.dart';

class AuthState extends ChangeNotifier {
  final AuthService _authService;

  AppUser? _currentUser;
  bool _isLoading = true;
  String? _errorMessage;

  AuthState(this._authService) {
    _checkCurrentUser();
  }

  // Getters
  AppUser? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> _checkCurrentUser() async {
    try {
      _currentUser = await _authService.getCurrentUser();
    } catch (e) {
      debugPrint('Error checking current user: $e');
      _currentUser = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signIn(String email, String password) async {
    _startLoading();

    try {
      final user = await _authService.signIn(email, password);

      if (user != null) {
        _currentUser = user;
        return true; // success event handled by caller
      } else {
        _errorMessage = "Invalid credentials";
        return false;
      }
    } catch (e) {
      _errorMessage = "Login failed. Please try again.";
      return false;
    } finally {
      _stopLoading();
    }
  }

  Future<bool> register(String name, String email, String password) async {
    _startLoading();

    try {
      final user = await _authService.register(name, email, password);

      if (user != null) {
        _currentUser = user;
        return true;
      } else {
        _errorMessage = "Registration failed";
        return false;
      }
    } catch (e) {
      _errorMessage = "Something went wrong during registration.";
      return false;
    } finally {
      _stopLoading();
    }
  }

  Future<void> signOut() async {
    _startLoading();

    try {
      await _authService.signOut();
      _currentUser = null;
    } catch (e) {
      _errorMessage = "Sign out failed";
    } finally {
      _stopLoading();
    }
  }

  void _startLoading() {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
  }

  void _stopLoading() {
    _isLoading = false;
    notifyListeners();
  }
}