import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static final List<Map<String, String>> _notifications = [
    {
      'title': 'Order Delivered',
      'body': 'Your order #1234 has been delivered successfully.',
      'time': '2 min ago',
      'icon': 'check_circle',
    },
    {
      'title': 'Special Offer!',
      'body': 'Get 20% off on all burgers this weekend.',
      'time': '1 hour ago',
      'icon': 'local_offer',
    },
    {
      'title': 'Order Confirmed',
      'body': 'Your order #1230 has been confirmed and is being prepared.',
      'time': '3 hours ago',
      'icon': 'receipt_long',
    },
    {
      'title': 'New Item Added',
      'body': 'Check out our new Spicy Chicken Burger!',
      'time': 'Yesterday',
      'icon': 'fastfood',
    },
    {
      'title': 'Welcome!',
      'body': 'Thanks for joining Raihan Food Corner. Enjoy your meals!',
      'time': '2 days ago',
      'icon': 'celebration',
    },
  ];

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'check_circle':
        return Icons.check_circle_outline;
      case 'local_offer':
        return Icons.local_offer_outlined;
      case 'receipt_long':
        return Icons.receipt_long_outlined;
      case 'fastfood':
        return Icons.fastfood_outlined;
      case 'celebration':
        return Icons.celebration_outlined;
      default:
        return Icons.notifications_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), centerTitle: true),
      body: _notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.notifications_off_outlined,
                    size: 64,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.3),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications yet',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _notifications.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getIcon(notification['icon']!),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  title: Text(
                    notification['title']!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      notification['body']!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  trailing: Text(
                    notification['time']!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.4),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
