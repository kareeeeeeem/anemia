import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class MyBagScreen extends StatelessWidget {
  const MyBagScreen({super.key});

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
                  const Text('My Bag', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _tab('All', true),
                  const SizedBox(width: 10),
                  _tab('Frames', false),
                  const SizedBox(width: 10),
                  _tab('Bubbles', false),
                  const SizedBox(width: 10),
                  _tab('Effects', false),
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
                  _bagItem('🖼️', 'Golden Frame', '29d left', AppColors.gold, true),
                  _bagItem('💬', 'Star Bubble', '15d left', AppColors.primary, true),
                  _bagItem('✨', 'Sparkle Entry', '7d left', AppColors.pink, true),
                  _bagItem('🎭', 'Mask Frame', 'Expired', AppColors.textMuted, false),
                  _bagItem('🌈', 'Rainbow Chat', '45d left', AppColors.teal, true),
                  _bagItem('🔥', 'Fire Effect', '3d left', AppColors.orange, true),
                  _bagItem('❄️', 'Ice Frame', 'Permanent', const Color(0xFF42A5F5), true),
                  _bagItem('🎪', 'Circus Bubble', '20d left', AppColors.red, true),
                  _bagItem('💫', 'Galaxy Entry', 'Permanent', AppColors.primary, true),
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
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: active ? null : Border.all(color: AppColors.cardBorder),
      ),
      child: Text(label, style: TextStyle(color: active ? AppColors.textPrimary : AppColors.textMuted, fontSize: 13)),
    );
  }

  static Widget _bagItem(String emoji, String name, String status, Color color, bool active) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: active ? color.withValues(alpha: 0.3) : AppColors.cardBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: TextStyle(fontSize: 30, color: active ? null : Colors.grey)),
          const SizedBox(height: 6),
          Text(name, style: TextStyle(color: active ? AppColors.textPrimary : AppColors.textMuted, fontSize: 11, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
          const SizedBox(height: 4),
          Text(status, style: TextStyle(color: active ? color : AppColors.textMuted, fontSize: 10)),
        ],
      ),
    );
  }
}
