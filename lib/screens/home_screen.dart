import 'package:flutter/material.dart';
import 'package:medvault/services/auth_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context, listen: false);
    final userName = authState.currentUser?.name ?? 'User';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authState.signOut();
            },
            tooltip: 'Sign Out',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome, $userName!',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text('You are successfully logged in.'),
          ],
        ),
      ),
    );
  }
}
