import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.textPrimary,
                        size: 20,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Tasks',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.orange.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('🎁', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  // Invite banner
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8B6914), Color(0xFF6B4E0A)],
                      ),
                      border: Border.all(
                        color: AppColors.gold.withOpacity(0.5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Invite friends to get golds',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            ...List.generate(3, (i) {
                              return const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Text('🪙', style: TextStyle(fontSize: 18)),
                              );
                            }),
                            const Text(
                              'Earn up to 5,000 🪙 per referral',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Tab selector
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Daily',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 30,
                            height: 3,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 24),
                      const Text(
                        'Novice',
                        style: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Task items
                  _taskItem(
                    emoji: '⏰',
                    title: 'In chat room 30min',
                    progress: '0/30',
                    coins: 10,
                    xp: 200,
                    color: AppColors.gold,
                  ),
                  const SizedBox(height: 10),
                  _taskItem(
                    emoji: '🎤',
                    title: 'On Mic 30m',
                    progress: '0/30',
                    coins: 40,
                    xp: 200,
                    color: AppColors.teal,
                  ),
                  const SizedBox(height: 10),
                  _taskItem(
                    emoji: '🎁',
                    title: 'Send gift for 3 times',
                    progress: '0/3',
                    coins: 60,
                    xp: 200,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 10),
                  _taskItem(
                    emoji: '🎡',
                    title: 'Play once Wheel',
                    progress: null,
                    coins: 30,
                    xp: 200,
                    color: AppColors.orange,
                  ),
                  const SizedBox(height: 10),
                  _taskItem(
                    emoji: '💎',
                    title: 'Daily recharge',
                    progress: null,
                    coins: 600,
                    xp: 1000,
                    color: AppColors.pink,
                  ),
                  const SizedBox(height: 10),
                  _taskItem(
                    emoji: '📹',
                    title: 'Paid Match Video',
                    progress: '0/3',
                    coins: 1500,
                    xp: 1500,
                    color: AppColors.red,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _taskItem({
    required String emoji,
    required String title,
    String? progress,
    required int coins,
    required int xp,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          // Progress circle
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color.withOpacity(0.4), width: 2),
              color: color.withOpacity(0.1),
            ),
          ),
          const SizedBox(width: 10),
          // Icon
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 12),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (progress != null) ...[
                      const SizedBox(width: 6),
                      Text(
                        progress,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '+$coins 🪙',
                      style: const TextStyle(
                        color: AppColors.teal,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '+$xp 🔥',
                      style: const TextStyle(
                        color: AppColors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Do it button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: const Text(
              'Do it',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
