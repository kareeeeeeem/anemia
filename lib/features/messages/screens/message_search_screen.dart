import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class MessageSearchScreen extends StatelessWidget {
  const MessageSearchScreen({super.key});

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
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(24), border: Border.all(color: AppColors.cardBorder)),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: AppColors.textMuted, size: 20),
                          SizedBox(width: 8),
                          Expanded(child: Text('Search messages...', style: TextStyle(color: AppColors.textMuted, fontSize: 14))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Quick filters
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _filterChip('All', true),
                  const SizedBox(width: 8),
                  _filterChip('People', false),
                  const SizedBox(width: 8),
                  _filterChip('Groups', false),
                  const SizedBox(width: 8),
                  _filterChip('Media', false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Frequent contacts
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft, child: Text('Frequent', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600))),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 75,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _contactCircle('Luna', const [Color(0xFFE91E63), Color(0xFFF48FB1)]),
                  _contactCircle('Omar', const [Color(0xFF42A5F5), Color(0xFF90CAF9)]),
                  _contactCircle('Sara', const [Color(0xFFFF9800), Color(0xFFFFB74D)]),
                  _contactCircle('Kai', const [Color(0xFF4CAF50), Color(0xFF81C784)]),
                  _contactCircle('Nora', const [Color(0xFF00BCD4), Color(0xFF26C6DA)]),
                  _contactCircle('Ali', const [Color(0xFF7C5CBF), Color(0xFF9575CD)]),
                ],
              ),
            ),
            const Divider(color: AppColors.cardBorder, height: 1),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft, child: Text('Recent Chats', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600))),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                children: [
                  _chatItem('Luna', 'See you there! ❤️', '2m ago', const [Color(0xFFE91E63), Color(0xFFF48FB1)]),
                  _chatItem('Omar', 'Sounds good bro 👍', '15m ago', const [Color(0xFF42A5F5), Color(0xFF90CAF9)]),
                  _chatItem('Sara', 'Thanks for the gift! 🎁', '1h ago', const [Color(0xFFFF9800), Color(0xFFFFB74D)]),
                  _chatItem('Game Group', '5 new messages', '2h ago', const [Color(0xFF4CAF50), Color(0xFF81C784)]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _filterChip(String label, bool active) {
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

  static Widget _contactCircle(String name, List<Color> colors) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          AvatarCircle(size: 48, gradientColors: colors),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
        ],
      ),
    );
  }

  static Widget _chatItem(String name, String msg, String time, List<Color> colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.cardBorder)),
      child: Row(
        children: [
          AvatarCircle(size: 42, gradientColors: colors),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                Text(msg, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
          Text(time, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
        ],
      ),
    );
  }
}
