import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ClubRewardScreen extends StatelessWidget {
  const ClubRewardScreen({super.key});

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
                  const Text('Club Rewards', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _tab('Daily', true),
                  const SizedBox(width: 10),
                  _tab('Weekly', false),
                  const SizedBox(width: 10),
                  _tab('Monthly', false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _rewardCard('🏆', 'Top Club Bonus', '5,000 coins', 'Rank #1 this week', AppColors.gold, true),
                  _rewardCard('🎯', 'Activity Goal', '1,000 coins', 'Complete 10 activities', AppColors.teal, false),
                  _rewardCard('👥', 'Member Growth', '2,000 coins', 'Invite 5 new members', AppColors.primary, false),
                  _rewardCard('🎤', 'Stream Hours', '500 coins', 'Stream 10 hours total', AppColors.pink, true),
                  _rewardCard('💎', 'Gift Revenue', '3,000 coins', 'Earn 50K in gifts', AppColors.orange, false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _tab(String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: TextStyle(color: active ? AppColors.textPrimary : AppColors.textMuted, fontSize: 13)),
    );
  }

  static Widget _rewardCard(String emoji, String title, String reward, String desc, Color color, bool claimed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.15), shape: BoxShape.circle),
            child: Text(emoji, style: const TextStyle(fontSize: 22)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(desc, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                const SizedBox(height: 4),
                Text('🪙 $reward', style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: claimed ? AppColors.textMuted.withValues(alpha: 0.2) : color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              claimed ? 'Claimed' : 'Claim',
              style: TextStyle(color: claimed ? AppColors.textMuted : AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
