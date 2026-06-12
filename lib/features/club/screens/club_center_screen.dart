import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class ClubCenterScreen extends StatelessWidget {
  const ClubCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: AppColors.textPrimary)),
                  const SizedBox(width: 16),
                  const Text('Club Center', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  const Icon(Icons.settings, color: AppColors.textMuted, size: 22),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Club header
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.primary.withValues(alpha: 0.2), AppColors.background]),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const AvatarCircle(size: 60, gradientColors: [Color(0xFF7C5CBF), Color(0xFF9575CD)], borderColor: AppColors.primary, borderWidth: 2),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Royal Stars ⭐', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('1,240 members · Rank #3', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Stats row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: _statCard('458K', 'Total Score', AppColors.gold)),
                  const SizedBox(width: 10),
                  Expanded(child: _statCard('32', 'Active Today', AppColors.teal)),
                  const SizedBox(width: 10),
                  Expanded(child: _statCard('12', 'Rooms Live', AppColors.pink)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Menu items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _menuItem('👥', 'Members', '1,240', AppColors.primary),
                  _menuItem('🏆', 'Rankings', 'Rank #3', AppColors.gold),
                  _menuItem('🎁', 'Rewards', '5 available', AppColors.pink),
                  _menuItem('📊', 'Statistics', 'View details', AppColors.teal),
                  _menuItem('📢', 'Announcements', '2 new', AppColors.orange),
                  _menuItem('⚙️', 'Settings', 'Manage', AppColors.textMuted),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _statCard(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
        ],
      ),
    );
  }

  static Widget _menuItem(String emoji, String title, String subtitle, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 14),
          Expanded(
            child: Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 15, fontWeight: FontWeight.w500)),
          ),
          Text(subtitle, style: TextStyle(color: color, fontSize: 13)),
          const SizedBox(width: 6),
          const Icon(Icons.chevron_right, color: AppColors.textMuted, size: 18),
        ],
      ),
    );
  }
}
