import 'package:flutter/material.dart';
import 'package:medvault/services/auth_state.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userName =
        Provider.of<AuthState>(context).currentUser?.name ?? 'User';

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
    'Welcome back,',
     style: Theme.of(context).textTheme.titleMedium,
),
const SizedBox(height: 4),
Text(
  userName,
  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
),
        const SizedBox(height: 24),
        Text('Quick Actions', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _QuickActionButton(
              icon: Icons.add_circle_outline,
              label: 'New Record',
              onPressed: () {},
            ),
            _QuickActionButton(
              icon: Icons.calendar_today_outlined,
              label: 'Appointments',
              onPressed: () {},
            ),
            _QuickActionButton(
              icon: Icons.receipt_long_outlined,
              label: 'View Reports',
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Divider(),
        const SizedBox(height: 16),
        Text('Recent Activity', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        // Placeholder for recent activity list
        const ListTile(
          leading: Icon(Icons.folder_open_outlined),
          title: Text('Blood Test Results'),
          subtitle: Text('Today'),
        ),
        const ListTile(
          leading: Icon(Icons.person_outline),
          title: Text('Consultation with Dr. Smith'),
          subtitle: Text('Yesterday'),
        ),
      ],
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.filled(
          icon: Icon(icon),
          iconSize: 32,
          onPressed: onPressed,
          style: IconButton.styleFrom(padding: const EdgeInsets.all(16)),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
