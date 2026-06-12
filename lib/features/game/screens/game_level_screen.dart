import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class GameLevelScreen extends StatelessWidget {
  const GameLevelScreen({super.key});

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
                  const Text('Game Level', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Level display
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.teal.withValues(alpha: 0.2), AppColors.background]),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.teal.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  const Text('🎮', style: TextStyle(fontSize: 40)),
                  const SizedBox(height: 8),
                  const Text('Level 28', style: TextStyle(color: AppColors.textPrimary, fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Game Master', style: TextStyle(color: AppColors.teal, fontSize: 14)),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.65,
                      backgroundColor: AppColors.surfaceLight,
                      valueColor: const AlwaysStoppedAnimation(AppColors.teal),
                      minHeight: 10,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('6,500 / 10,000 XP', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                      Text('Lv.29', style: TextStyle(color: AppColors.teal, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Level perks
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft, child: Text('Level Perks', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600))),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _perkItem('🏆', 'Game Profile Badge', 'Display your level badge', AppColors.gold, true),
                  _perkItem('🎯', 'Priority Matchmaking', 'Match with same-level players', AppColors.primary, true),
                  _perkItem('💰', 'Bonus Rewards', '1.5x game rewards', AppColors.teal, true),
                  _perkItem('✨', 'Special Effects', 'Unlock game victory effects', AppColors.pink, false),
                  _perkItem('👑', 'Game Room Creation', 'Create exclusive game rooms', AppColors.orange, false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _perkItem(String emoji, String title, String desc, Color color, bool unlocked) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: unlocked ? color.withValues(alpha: 0.3) : AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Opacity(opacity: unlocked ? 1.0 : 0.4, child: Text(emoji, style: const TextStyle(fontSize: 24))),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: unlocked ? AppColors.textPrimary : AppColors.textMuted, fontSize: 14, fontWeight: FontWeight.w600)),
                Text(desc, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
          Icon(unlocked ? Icons.check_circle : Icons.lock, color: unlocked ? AppColors.green : AppColors.textMuted, size: 22),
        ],
      ),
    );
  }
}
