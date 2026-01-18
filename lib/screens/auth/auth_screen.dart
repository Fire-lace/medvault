import 'package:flutter/material.dart';
import 'package:medvault/screens/auth/login_screen.dart';
import 'package:medvault/screens/auth/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _showLoginScreen = true;

  void _toggleScreen() {
    setState(() {
      _showLoginScreen = !_showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showLoginScreen) {
      return LoginScreen(onSwitchToRegister: _toggleScreen);
    } else {
      return RegisterScreen(onSwitchToLogin: _toggleScreen);
    }
  }
}
