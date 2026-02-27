import 'package:flutter/foundation.dart';
import 'package:medvault/models/app_user.dart';
import 'package:medvault/services/auth_service.dart';

class AuthState extends ChangeNotifier {
  final AuthService _authService;

  AppUser? _currentUser;
  bool _isLoading = true;

  AuthState(this._authService) {
    _checkCurrentUser();
  }

  AppUser? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;
  bool get isLoading => _isLoading;

  Future<void> _checkCurrentUser() async {
    try {
      _currentUser = await _authService.getCurrentUser();
    } catch (e) {
      debugPrint('Error checking current user: $e');
      _currentUser = null;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final user = await _authService.signIn(email, password);

    _isLoading = false;

    if (user != null) {
      _currentUser = user;
      notifyListeners();
      return true;
    }

    notifyListeners();
    return false;
  }

  Future<bool> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final user = await _authService.register(name, email, password);

    _isLoading = false;

    if (user != null) {
      _currentUser = user;
      notifyListeners();
      return true;
    }

    notifyListeners();
    return false;
  }

  Future<void> signOut() async {
    _isLoading = true;
    notifyListeners();

    await _authService.signOut();
    _currentUser = null;

    _isLoading = false;
    notifyListeners();
  }
}