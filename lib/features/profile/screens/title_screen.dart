import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

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
                  const Text('Titles', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Current title
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.gold.withValues(alpha: 0.15), AppColors.background]),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const Text('👑', style: TextStyle(fontSize: 28)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Current Title', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                        SizedBox(height: 4),
                        Text('Voice Star', style: TextStyle(color: AppColors.gold, fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: AppColors.gold, borderRadius: BorderRadius.circular(12)),
                    child: const Text('Equipped', style: TextStyle(color: AppColors.background, fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft, child: Text('Available Titles', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600))),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _titleItem('🎤', 'Voice Star', 'Host 50 rooms', AppColors.gold, true, true),
                  _titleItem('💎', 'Diamond VIP', 'Reach SVIP 3', const Color(0xFF42A5F5), true, false),
                  _titleItem('🌟', 'Superstar', '10K followers', AppColors.primary, true, false),
                  _titleItem('🔥', 'Hot Streaker', '60-day login streak', AppColors.orange, false, false),
                  _titleItem('👑', 'King of Gifts', 'Send 5000 gifts', AppColors.pink, false, false),
                  _titleItem('⚡', 'Legend', 'Reach Lv.60', AppColors.teal, false, false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _titleItem(String emoji, String name, String requirement, Color color, bool unlocked, bool equipped) {
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
          Opacity(opacity: unlocked ? 1.0 : 0.4, child: Text(emoji, style: const TextStyle(fontSize: 26))),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(color: unlocked ? AppColors.textPrimary : AppColors.textMuted, fontSize: 15, fontWeight: FontWeight.w600)),
                Text(requirement, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
          if (equipped)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(color: AppColors.gold, borderRadius: BorderRadius.circular(10)),
              child: const Text('In Use', style: TextStyle(color: AppColors.background, fontSize: 11, fontWeight: FontWeight.bold)),
            )
          else if (unlocked)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
              child: const Text('Equip', style: TextStyle(color: AppColors.textPrimary, fontSize: 11, fontWeight: FontWeight.w600)),
            )
          else
            const Icon(Icons.lock, color: AppColors.textMuted, size: 18),
        ],
      ),
    );
  }
}
