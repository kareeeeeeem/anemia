import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class MomentFeedScreen extends StatelessWidget {
  const MomentFeedScreen({super.key});

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
                  const Text('Moments', style: TextStyle(color: AppColors.textPrimary, fontSize: 22, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.add, color: AppColors.textPrimary, size: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Stories row
            SizedBox(
              height: 85,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _storyItem('Your Story', true, const [Color(0xFF7C5CBF), Color(0xFF9575CD)]),
                  _storyItem('Luna', false, const [Color(0xFFE91E63), Color(0xFFF48FB1)]),
                  _storyItem('Omar', false, const [Color(0xFF42A5F5), Color(0xFF90CAF9)]),
                  _storyItem('Sara', false, const [Color(0xFFFF9800), Color(0xFFFFB74D)]),
                  _storyItem('Kai', false, const [Color(0xFF4CAF50), Color(0xFF81C784)]),
                  _storyItem('Nora', false, const [Color(0xFF00BCD4), Color(0xFF26C6DA)]),
                ],
              ),
            ),
            const Divider(color: AppColors.cardBorder, height: 1),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                children: [
                  _momentPost(
                    'Luna', '2h ago',
                    'Beautiful sunset today! 🌅 Who else loves golden hour?',
                    const [Color(0xFFE91E63), Color(0xFFF48FB1)],
                    hasImage: true,
                    likes: 234, comments: 18,
                  ),
                  _momentPost(
                    'Omar', '4h ago',
                    'Just reached VIP Gold! Thank you all for the support ❤️✨',
                    const [Color(0xFF42A5F5), Color(0xFF90CAF9)],
                    hasImage: false,
                    likes: 156, comments: 42,
                  ),
                  _momentPost(
                    'Sara', '6h ago',
                    'New room opening tonight at 9pm! Come join us for karaoke night 🎤🎶',
                    const [Color(0xFFFF9800), Color(0xFFFFB74D)],
                    hasImage: true,
                    likes: 89, comments: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _storyItem(String name, bool isAdd, List<Color> colors) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          Stack(
            children: [
              AvatarCircle(
                size: 56,
                gradientColors: colors,
                borderColor: isAdd ? null : AppColors.primary,
                borderWidth: 2,
              ),
              if (isAdd)
                Positioned(
                  bottom: 0, right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                    child: const Icon(Icons.add, color: AppColors.textPrimary, size: 14),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
        ],
      ),
    );
  }

  static Widget _momentPost(String name, String time, String text, List<Color> colors, {required bool hasImage, required int likes, required int comments}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AvatarCircle(size: 40, gradientColors: colors),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                    Text(time, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz, color: AppColors.textMuted, size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Text(text, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.4)),
          if (hasImage) ...[
            const SizedBox(height: 10),
            Container(
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [colors[0].withValues(alpha: 0.3), colors[1].withValues(alpha: 0.1)]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Icon(Icons.image, color: AppColors.textMuted, size: 40)),
            ),
          ],
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.favorite_border, color: AppColors.textMuted, size: 20),
              const SizedBox(width: 4),
              Text('$likes', style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
              const SizedBox(width: 20),
              const Icon(Icons.chat_bubble_outline, color: AppColors.textMuted, size: 18),
              const SizedBox(width: 4),
              Text('$comments', style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
              const Spacer(),
              const Icon(Icons.share_outlined, color: AppColors.textMuted, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
