import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class BigVoiceRoomScreen extends StatelessWidget {
  const BigVoiceRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: AppColors.textPrimary)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Midnight Vibes 🌙', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('Room ID: 892341', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
                      ],
                    ),
                  ),
                  const Icon(Icons.volume_up, color: AppColors.textSecondary, size: 22),
                  const SizedBox(width: 16),
                  const Icon(Icons.more_vert, color: AppColors.textSecondary, size: 22),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Online count
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.people, color: AppColors.teal, size: 16),
                  const SizedBox(width: 6),
                  const Text('128 online', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Host section
            const AvatarCircle(size: 70, gradientColors: [Color(0xFFFFD700), Color(0xFFFFA000)], borderColor: AppColors.gold, borderWidth: 3),
            const SizedBox(height: 6),
            const Text('DJ Khalid', style: TextStyle(color: AppColors.gold, fontSize: 14, fontWeight: FontWeight.w600)),
            const Text('Host', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
            const SizedBox(height: 16),
            // Speaker grid - 5 rows of 4
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  final speakers = ['Aria', 'Khalid', null, 'Nova', 'Sam', null, null, 'Lina', null, 'Zara',
                    null, 'Omar', null, null, 'Mia', null, null, 'Jay', null, null];
                  final name = speakers[index];
                  if (name == null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 44, height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceLight,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.cardBorder),
                          ),
                          child: const Icon(Icons.add, color: AppColors.textMuted, size: 18),
                        ),
                        const SizedBox(height: 4),
                        Text('${index + 1}', style: const TextStyle(color: AppColors.textMuted, fontSize: 9)),
                      ],
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AvatarCircle(size: 44, gradientColors: [AppColors.primary.withValues(alpha: 0.7), AppColors.teal.withValues(alpha: 0.7)]),
                      const SizedBox(height: 4),
                      Text(name, style: const TextStyle(color: AppColors.textSecondary, fontSize: 9), overflow: TextOverflow.ellipsis),
                    ],
                  );
                },
              ),
            ),
            // Chat messages
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  _chatMsg('Aria', 'Welcome everyone! 🎶'),
                  _chatMsg('Nova', 'Love this vibe tonight'),
                  _chatMsg('Sam', '🔥🔥🔥'),
                ],
              ),
            ),
            // Bottom bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(color: AppColors.surface, border: Border(top: BorderSide(color: AppColors.cardBorder))),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(color: AppColors.surfaceLight, borderRadius: BorderRadius.circular(20)),
                      child: const Text('Say something...', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _circleBtn(Icons.mic_off, AppColors.red),
                  const SizedBox(width: 8),
                  _circleBtn(Icons.emoji_emotions_outlined, AppColors.textSecondary),
                  const SizedBox(width: 8),
                  _circleBtn(Icons.card_giftcard, AppColors.gold),
                  const SizedBox(width: 8),
                  _circleBtn(Icons.more_horiz, AppColors.textSecondary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _chatMsg(String name, String msg) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: '$name: ', style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w600)),
          TextSpan(text: msg, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
        ]),
      ),
    );
  }

  static Widget _circleBtn(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: AppColors.surfaceLight, shape: BoxShape.circle),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
