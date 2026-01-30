import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.redAccent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 32),
              _buildProfileMenuList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
        ),
        SizedBox(height: 16),
        Text(
          'John Doe',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          'johndoe@example.com',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildProfileMenuList(BuildContext context) {
    return Column(
      children: [
        _buildProfileMenuItem(
          icon: Icons.person_outline,
          title: 'Edit Profile',
          onTap: () {
            // Navigate to edit profile screen
          },
        ),
        _buildProfileMenuItem(
          icon: Icons.settings_outlined,
          title: 'Settings',
          onTap: () {
            // Navigate to settings screen
          },
        ),
        _buildProfileMenuItem(
          icon: Icons.credit_card,
          title: 'Payment Methods',
          onTap: () {
            // Navigate to payment methods screen
          },
        ),
        _buildProfileMenuItem(
          icon: Icons.history,
          title: 'Order History',
          onTap: () {
            // Navigate to order history screen
          },
        ),
        const Divider(),
        _buildProfileMenuItem(
          icon: Icons.logout,
          title: 'Logout',
          textColor: Colors.yellow,
          onTap: () {
            // Handle logout
          },
        ),
      ],
    );
  }

  Widget _buildProfileMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color textColor = Colors.white,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(title, style: TextStyle(color: textColor, fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white, size: 16),
      onTap: onTap,
    );
  }
}
