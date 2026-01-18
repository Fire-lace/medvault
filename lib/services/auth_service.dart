import 'package:medvault/models/app_user.dart';

abstract class AuthService {
  Future<AppUser?> signIn(String email, String password);
  Future<AppUser?> register(String name, String email, String password);
  Future<void> signOut();
  Future<AppUser?> getCurrentUser();
}

class FakeAuthService implements AuthService {
  AppUser? _currentUser;

  @override
  Future<AppUser?> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _currentUser;
  }

  @override
  Future<AppUser?> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = AppUser(
      id: 'fake-id-${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      name: 'Fake User', // In a real app, you'd fetch the name
    );
    return _currentUser;
  }

  @override
  Future<AppUser?> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = AppUser(
      id: 'fake-id-${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      name: name,
    );
    return _currentUser;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }
}
