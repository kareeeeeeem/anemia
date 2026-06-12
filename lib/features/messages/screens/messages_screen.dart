import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                children: [
                  const AvatarCircle(
                    size: 40,
                    gradientColors: [AppColors.pink, Color(0xFFE040FB)],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      const Text(
                        'Messages',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.teal,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Friends',
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.settings,
                      color: AppColors.textSecondary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Message list
            Expanded(
              child: ListView(
                children: [
                  _messageItem(
                    letter: 'S',
                    colors: const [Color(0xFFE91E63), Color(0xFFAD1457)],
                    name: 'Shyra',
                    message: 'Is this your first time using this...',
                    time: '0',
                  ),
                  _messageItem(
                    letter: 'E',
                    colors: const [Color(0xFF9C27B0), Color(0xFF7B1FA2)],
                    name: 'EDELYN',
                    message: 'Hello! What are you doing now',
                    time: '03-09 18',
                  ),
                  _messageItem(
                    letter: 'C',
                    colors: const [Color(0xFF00BCD4), Color(0xFF0097A7)],
                    name: 'Camillia',
                    message: 'Hi~ How\'s your day been?',
                    time: '03-09 1',
                  ),
                  _messageItem(
                    letter: 'A',
                    colors: const [Color(0xFFE91E63), Color(0xFFF48FB1)],
                    name: 'Alliyah',
                    message: 'Ding dong~ Is anyone online',
                    time: '03-09 12',
                  ),
                  _messageItem(
                    letter: 'S',
                    colors: const [Color(0xFF4CAF50), Color(0xFFFF9800)],
                    name: 'SuNGiT',
                    message: 'Call duration: 00:02',
                    time: '03-09 12',
                  ),
                  _messageItem(
                    letter: 'C',
                    colors: const [Color(0xFFFFEB3B), Color(0xFFFFC107)],
                    name: 'CLOUD',
                    message: 'call?',
                    time: '03-09 1',
                  ),
                  _messageItem(
                    letter: 'V',
                    colors: const [Color(0xFF9C27B0), Color(0xFFE91E63)],
                    name: 'VERRA',
                    message: 'hi call? 🖤',
                    time: '03-09 12',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageItem({
    required String letter,
    required List<Color> colors,
    required String name,
    required String message,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          AvatarCircle(
            size: 50,
            gradientColors: colors,
            letter: letter,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
