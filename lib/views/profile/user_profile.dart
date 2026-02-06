import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildProfileHeader(context),
              const SizedBox(height: 32),
              _buildProfileMenuList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
        ),
        const SizedBox(height: 16),
        Text(
          'John Doe',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: scheme.onBackground),
        ),
        const SizedBox(height: 4),
        Text(
          'johndoe@example.com',
          style: TextStyle(fontSize: 16, color: scheme.onBackground.withOpacity(0.7)),
        ),
      ],
    );
  }

  Widget _buildProfileMenuList(BuildContext context) {
    return Column(
      children: [
        _buildProfileMenuItem(
          context,
          icon: Icons.person_outline,
          title: 'Edit Profile',
          onTap: () {
            // Navigate to edit profile screen
          },
        ),
        _buildProfileMenuItem(
          context,
          icon: Icons.settings_outlined,
          title: 'Settings',
          onTap: () {
            // Navigate to settings screen
          },
        ),
        _buildProfileMenuItem(
          context,
          icon: Icons.credit_card,
          title: 'Payment Methods',
          onTap: () {
            // Navigate to payment methods screen
          },
        ),
        _buildProfileMenuItem(
          context,
          icon: Icons.history,
          title: 'Order History',
          onTap: () {
            // Navigate to order history screen
          },
        ),
        const Divider(),
        _buildProfileMenuItem(
          context,
          icon: Icons.logout,
          title: 'Logout',
          textColor: Theme.of(context).colorScheme.primary,
          onTap: () {
            // Handle logout
          },
        ),
      ],
    );
  }

  Widget _buildProfileMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color resolved = textColor ?? scheme.onBackground;

    return ListTile(
      leading: Icon(icon, color: resolved),
      title: Text(title, style: TextStyle(color: resolved, fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, color: scheme.onBackground.withOpacity(0.6), size: 16),
      onTap: onTap,
    );
  }
}
