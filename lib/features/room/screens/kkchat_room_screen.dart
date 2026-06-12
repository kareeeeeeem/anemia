import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class KkchatRoomScreen extends StatelessWidget {
  const KkchatRoomScreen({super.key});

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
                        const Text('KK Chat Room 💬', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('42 chatting now', style: TextStyle(color: AppColors.teal, fontSize: 11)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: AppColors.teal.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.people, color: AppColors.teal, size: 14),
                        SizedBox(width: 4),
                        Text('42', style: TextStyle(color: AppColors.teal, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Active users row
            SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 8,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final names = ['Luna', 'Kai', 'Nora', 'Zain', 'Maya', 'Ali', 'Sara', 'Omar'];
                  final colors = [
                    [const Color(0xFF9C27B0), const Color(0xFFCE93D8)],
                    [const Color(0xFF00BCD4), const Color(0xFF26C6DA)],
                    [const Color(0xFFE91E63), const Color(0xFFF48FB1)],
                    [const Color(0xFFFF9800), const Color(0xFFFFB74D)],
                    [const Color(0xFF4CAF50), const Color(0xFF81C784)],
                    [const Color(0xFF7C5CBF), const Color(0xFF9575CD)],
                    [const Color(0xFFFFD700), const Color(0xFFFFA000)],
                    [const Color(0xFF00BCD4), const Color(0xFF80DEEA)],
                  ];
                  return Column(
                    children: [
                      AvatarCircle(size: 44, gradientColors: colors[index], borderColor: index == 0 ? AppColors.teal : null, borderWidth: 2),
                      const SizedBox(height: 4),
                      Text(names[index], style: const TextStyle(color: AppColors.textMuted, fontSize: 10)),
                    ],
                  );
                },
              ),
            ),
            const Divider(color: AppColors.cardBorder, height: 1),
            // Chat messages
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _chatBubble('Luna', 'Hey everyone! How are you today? 😊', true, const [Color(0xFF9C27B0), Color(0xFFCE93D8)]),
                  _chatBubble('Kai', 'Doing great! Just finished a game session 🎮', false, const [Color(0xFF00BCD4), Color(0xFF26C6DA)]),
                  _chatBubble('Nora', 'Anyone up for a voice room later?', true, const [Color(0xFFE91E63), Color(0xFFF48FB1)]),
                  _chatBubble('Zain', 'Count me in! 🙋‍♂️', false, const [Color(0xFFFF9800), Color(0xFFFFB74D)]),
                  _chatBubble('Maya', 'I just got VIP Gold! So excited ✨', true, const [Color(0xFF4CAF50), Color(0xFF81C784)]),
                  _chatBubble('Luna', 'Congrats Maya! 🎉🎉', false, const [Color(0xFF9C27B0), Color(0xFFCE93D8)]),
                  _chatBubble('Ali', 'Let\'s start the room at 9pm 🕘', true, const [Color(0xFF7C5CBF), Color(0xFF9575CD)]),
                ],
              ),
            ),
            // Input bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(color: AppColors.surface, border: Border(top: BorderSide(color: AppColors.cardBorder))),
              child: Row(
                children: [
                  const Icon(Icons.add_circle_outline, color: AppColors.textMuted, size: 26),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(color: AppColors.surfaceLight, borderRadius: BorderRadius.circular(20)),
                      child: const Text('Type a message...', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.emoji_emotions_outlined, color: AppColors.textMuted, size: 26),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                    child: const Icon(Icons.send, color: AppColors.textPrimary, size: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _chatBubble(String name, String msg, bool isLeft, List<Color> colors) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isLeft) ...[
            AvatarCircle(size: 32, gradientColors: colors),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isLeft ? AppColors.surface : AppColors.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(14),
                  topRight: const Radius.circular(14),
                  bottomLeft: Radius.circular(isLeft ? 4 : 14),
                  bottomRight: Radius.circular(isLeft ? 14 : 4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(color: colors[0], fontSize: 11, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(msg, style: const TextStyle(color: AppColors.textPrimary, fontSize: 13)),
                ],
              ),
            ),
          ),
          if (!isLeft) ...[
            const SizedBox(width: 8),
            AvatarCircle(size: 32, gradientColors: colors),
          ],
        ],
      ),
    );
  }
}
