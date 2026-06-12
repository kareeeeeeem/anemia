import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class MedalScreen extends StatelessWidget {
  const MedalScreen({super.key});

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
                  const Text('Medals', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text('8/24 collected', style: TextStyle(color: AppColors.gold, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _tab('All', true),
                  const SizedBox(width: 10),
                  _tab('Earned', false),
                  const SizedBox(width: 10),
                  _tab('Locked', false),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
                children: [
                  _medalItem('🏆', 'Champion', 'Win 10 PK battles', AppColors.gold, true),
                  _medalItem('🎤', 'Voice Star', 'Host 50 rooms', AppColors.primary, true),
                  _medalItem('💎', 'Diamond Hand', 'Send 1000 gifts', const Color(0xFF42A5F5), true),
                  _medalItem('❤️', 'Love Master', 'Reach CP Lv.10', AppColors.pink, true),
                  _medalItem('👑', 'King', 'Reach VIP 6', AppColors.gold, false),
                  _medalItem('🌟', 'Superstar', 'Get 10K followers', AppColors.orange, true),
                  _medalItem('🎯', 'Sharpshooter', 'Win 100 games', AppColors.teal, false),
                  _medalItem('🔥', 'Hot Streak', '30-day login', AppColors.red, true),
                  _medalItem('💫', 'Rising Star', 'First 100 fans', AppColors.primary, true),
                  _medalItem('🎪', 'Party Animal', 'Join 200 rooms', AppColors.pink, false),
                  _medalItem('🏅', 'Top Gifter', 'Top 3 weekly', AppColors.gold, true),
                  _medalItem('⚡', 'Speed King', 'First to join 50x', AppColors.orange, false),
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(color: active ? AppColors.primary : AppColors.surface, borderRadius: BorderRadius.circular(16)),
      child: Text(label, style: TextStyle(color: active ? AppColors.textPrimary : AppColors.textMuted, fontSize: 13)),
    );
  }

  static Widget _medalItem(String emoji, String name, String desc, Color color, bool earned) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: earned ? color.withValues(alpha: 0.4) : AppColors.cardBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: earned ? 1.0 : 0.3,
            child: Text(emoji, style: const TextStyle(fontSize: 30)),
          ),
          const SizedBox(height: 6),
          Text(name, style: TextStyle(color: earned ? AppColors.textPrimary : AppColors.textMuted, fontSize: 11, fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(desc, style: const TextStyle(color: AppColors.textMuted, fontSize: 9), textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
