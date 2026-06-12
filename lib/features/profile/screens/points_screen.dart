import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

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
                  const Text('Points', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Points balance
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF4A148C), Color(0xFF6A1B9A)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text('Total Points', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                  const SizedBox(height: 8),
                  const Text('45,280', style: TextStyle(color: AppColors.textPrimary, fontSize: 36, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
                    child: const Text('Redeem Points', style: TextStyle(color: AppColors.textPrimary, fontSize: 13)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Earn points section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft, child: Text('Earn Points', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600))),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _earnItem('🎤', 'Host a Room', '+100 pts/hour', AppColors.primary, '0/3 today'),
                  _earnItem('🎁', 'Send Gifts', '+10 pts/gift', AppColors.pink, 'Unlimited'),
                  _earnItem('💬', 'Chat Messages', '+1 pt/msg', AppColors.teal, '0/100 today'),
                  _earnItem('📅', 'Daily Login', '+50 pts', AppColors.gold, 'Claimed'),
                  _earnItem('🎮', 'Play Games', '+20 pts/game', AppColors.orange, '0/5 today'),
                  _earnItem('👥', 'Invite Friends', '+500 pts/invite', AppColors.green, 'Unlimited'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _earnItem(String emoji, String title, String reward, Color color, String status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.cardBorder)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.15), shape: BoxShape.circle),
            child: Text(emoji, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w500)),
                Text(reward, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Text(status, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
        ],
      ),
    );
  }
}
