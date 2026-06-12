import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class CpCoupleHomeScreen extends StatelessWidget {
  const CpCoupleHomeScreen({super.key});

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
                  const Text('CP Home', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Couple display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const AvatarCircle(size: 80, gradientColors: [Color(0xFFE91E63), Color(0xFFF48FB1)], borderColor: AppColors.pink, borderWidth: 3),
                    const SizedBox(height: 8),
                    const Text('Luna', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
                    const Text('Lv.52', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Text('❤️', style: TextStyle(fontSize: 32)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.pink.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('Lv.5', style: TextStyle(color: AppColors.pink, fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const AvatarCircle(size: 80, gradientColors: [Color(0xFF42A5F5), Color(0xFF90CAF9)], borderColor: Color(0xFF42A5F5), borderWidth: 3),
                    const SizedBox(height: 8),
                    const Text('Omar', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
                    const Text('Lv.48', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // CP progress
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('CP Points', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                      Text('98,500', style: TextStyle(color: AppColors.pink, fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.72,
                      backgroundColor: AppColors.surfaceLight,
                      valueColor: const AlwaysStoppedAnimation(AppColors.pink),
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('28,500 to next level', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: _actionCard('🎁', 'Send Gift', AppColors.pink)),
                  const SizedBox(width: 12),
                  Expanded(child: _actionCard('💌', 'Love Letter', AppColors.primary)),
                  const SizedBox(width: 12),
                  Expanded(child: _actionCard('🏆', 'Rankings', AppColors.gold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Milestones
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft, child: Text('Milestones', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600))),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _milestone('First Date', '7 days together', true),
                  _milestone('Sweet Month', '30 days together', true),
                  _milestone('100 Days', '100 days together', false),
                  _milestone('Anniversary', '365 days together', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _actionCard(String emoji, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  static Widget _milestone(String title, String subtitle, bool unlocked) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: unlocked ? AppColors.pink.withValues(alpha: 0.3) : AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Text(unlocked ? '✅' : '🔒', style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: unlocked ? AppColors.textPrimary : AppColors.textMuted, fontSize: 14, fontWeight: FontWeight.w600)),
                Text(subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
