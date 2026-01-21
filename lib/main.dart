import 'package:flutter/material.dart';
import 'package:medvault/screens/auth/auth_screen.dart';
import 'package:medvault/screens/home_shell.dart';
import 'package:medvault/services/auth_service.dart';
import 'package:medvault/services/auth_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthState(FakeAuthService()),
      child: MaterialApp(
        title: 'MedVault',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: const AuthGate(),
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(
      builder: (context, authState, _) {
        if (authState.isAuthenticated) {
          return const HomeShell();
        } else {
          return const AuthScreen();
        }
      },
    );
  }
}
