import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(bottom: BorderSide(color: AppColors.cardBorder)),
              ),
              child: Row(
                children: [
                  GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: AppColors.textPrimary)),
                  const SizedBox(width: 12),
                  const AvatarCircle(size: 36, gradientColors: [Color(0xFFE91E63), Color(0xFFF48FB1)]),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Luna', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
                        Text('Online', style: TextStyle(color: AppColors.teal, fontSize: 11)),
                      ],
                    ),
                  ),
                  const Icon(Icons.phone, color: AppColors.textSecondary, size: 22),
                  const SizedBox(width: 16),
                  const Icon(Icons.more_vert, color: AppColors.textSecondary, size: 22),
                ],
              ),
            ),
            // Messages
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _dateDivider('Today'),
                  _receivedMsg('Hey! Are you coming to the room tonight? 🎤'),
                  _sentMsg('Yes! I\'ll be there at 9pm 😊'),
                  _receivedMsg('Great! I\'m setting up a karaoke night'),
                  _sentMsg('Sounds amazing! Can\'t wait 🎶'),
                  _receivedMsg('I also invited Sara and Omar'),
                  _sentMsg('Perfect team! 🔥'),
                  _receivedMsg('See you there! ❤️'),
                ],
              ),
            ),
            // Input area
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(top: BorderSide(color: AppColors.cardBorder)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.add_circle_outline, color: AppColors.textMuted, size: 26),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(color: AppColors.surfaceLight, borderRadius: BorderRadius.circular(20)),
                      child: const Text('Type a message...', style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
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

  static Widget _dateDivider(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(color: AppColors.surfaceLight, borderRadius: BorderRadius.circular(10)),
          child: Text(text, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
        ),
      ),
    );
  }

  static Widget _receivedMsg(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const AvatarCircle(size: 28, gradientColors: [Color(0xFFE91E63), Color(0xFFF48FB1)]),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14), bottomRight: Radius.circular(14), bottomLeft: Radius.circular(4),
                ),
              ),
              child: Text(text, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _sentMsg(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 60),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.3),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14), topRight: Radius.circular(14), bottomLeft: Radius.circular(14), bottomRight: Radius.circular(4),
            ),
          ),
          child: Text(text, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14)),
        ),
      ),
    );
  }
}
