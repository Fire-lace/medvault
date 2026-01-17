class AuthService {
  Future<bool> login(String email, String password) async {
    // 1. Send credentials to SystemService
    // 2. System validates user
    // 3. Return result
    return true;
  }

  Future<bool> register(String email, String password) async {
    // Create new user account
    return true;
  }

  Future<void> logout() async {
    // End user session
  }
}