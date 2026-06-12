import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Mark all read',
                    style: TextStyle(color: AppColors.primary, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _tab('All', true),
                  const SizedBox(width: 12),
                  _tab('Gifts', false),
                  const SizedBox(width: 12),
                  _tab('System', false),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Notifications list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _notifItem(
                    'Yasmine sent you a Diamond!',
                    '2 min ago',
                    Icons.diamond,
                    AppColors.primary,
                    const [Color(0xFF9C27B0), Color(0xFFCE93D8)],
                  ),
                  const SizedBox(height: 10),
                  _notifItem(
                    'VIP Gold Level Up!',
                    '15 min ago',
                    Icons.star,
                    AppColors.gold,
                    const [Color(0xFFD4A843), Color(0xFFFFD700)],
                  ),
                  const SizedBox(height: 10),
                  _notifItem(
                    'PK Battle Invitation',
                    '1 hour ago',
                    Icons.flash_on,
                    AppColors.red,
                    const [Color(0xFFE91E63), Color(0xFFF48FB1)],
                  ),
                  const SizedBox(height: 10),
                  _notifItem(
                    'Layla started following you',
                    '2 hours ago',
                    Icons.person_add,
                    AppColors.teal,
                    const [Color(0xFF00BCD4), Color(0xFF26C6DA)],
                  ),
                  const SizedBox(height: 10),
                  _notifItem(
                    'Room "Midnight Jazz" is now live!',
                    '3 hours ago',
                    Icons.mic,
                    AppColors.green,
                    const [Color(0xFF4CAF50), Color(0xFF81C784)],
                  ),
                  const SizedBox(height: 10),
                  _notifItem(
                    'Daily reward claimed: 50 coins',
                    '5 hours ago',
                    Icons.card_giftcard,
                    AppColors.orange,
                    const [Color(0xFFFF9800), Color(0xFFFFB74D)],
                  ),
                  const SizedBox(height: 10),
                  _notifItem(
                    'New club event starting soon!',
                    '8 hours ago',
                    Icons.celebration,
                    AppColors.pink,
                    const [Color(0xFFE91E63), Color(0xFFF48FB1)],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tab(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? AppColors.pink : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: isActive ? null : Border.all(color: AppColors.cardBorder),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.textPrimary : AppColors.textMuted,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _notifItem(String text, String time, IconData icon, Color color, List<Color> avatarColors) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          AvatarCircle(size: 44, gradientColors: avatarColors),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
              ],
            ),
          ),
          Icon(icon, color: color, size: 22),
        ],
      ),
    );
  }
}
