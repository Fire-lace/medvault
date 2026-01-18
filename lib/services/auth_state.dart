import 'package:flutter/foundation.dart';
import 'package:medvault/models/app_user.dart';
import 'package:medvault/services/auth_service.dart';

class AuthState extends ChangeNotifier {
  final AuthService _authService;
  AppUser? _currentUser;

  AuthState(this._authService) {
    _checkCurrentUser();
  }

  AppUser? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  Future<void> _checkCurrentUser() async {
    _currentUser = await _authService.getCurrentUser();
    notifyListeners();
  }

  Future<bool> signIn(String email, String password) async {
    final user = await _authService.signIn(email, password);
    if (user != null) {
      _currentUser = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register(String name, String email, String password) async {
    final user = await _authService.register(name, email, password);
    if (user != null) {
      _currentUser = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _currentUser = null;
    notifyListeners();
  }
}
