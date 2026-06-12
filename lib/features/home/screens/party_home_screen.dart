import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class PartyHomeScreen extends StatelessWidget {
  const PartyHomeScreen({super.key});

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
                  const Text('Party 🎉', style: TextStyle(color: AppColors.textPrimary, fontSize: 22, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.search, color: AppColors.textSecondary, size: 22),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.notifications_outlined, color: AppColors.textSecondary, size: 22),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF6A1B9A), Color(0xFF4A148C)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('🎤 Create Your Party', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Start a room and invite friends', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Categories
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _chip('All', true),
                  _chip('Music', false),
                  _chip('Chat', false),
                  _chip('Gaming', false),
                  _chip('Dating', false),
                  _chip('Education', false),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Party rooms list
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 6,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final rooms = [
                    {'name': 'Midnight Jazz 🎷', 'host': 'DJ Khalid', 'count': '128', 'tag': 'Music'},
                    {'name': 'Arabic Chat 💬', 'host': 'Sara', 'count': '85', 'tag': 'Chat'},
                    {'name': 'Game Night 🎮', 'host': 'Omar', 'count': '64', 'tag': 'Gaming'},
                    {'name': 'Love Corner ❤️', 'host': 'Luna', 'count': '52', 'tag': 'Dating'},
                    {'name': 'Karaoke Stars ⭐', 'host': 'Ali', 'count': '96', 'tag': 'Music'},
                    {'name': 'Study Group 📚', 'host': 'Nora', 'count': '31', 'tag': 'Education'},
                  ];
                  final room = rooms[index];
                  final tagColors = {
                    'Music': AppColors.primary, 'Chat': AppColors.teal, 'Gaming': AppColors.orange,
                    'Dating': AppColors.pink, 'Education': AppColors.green,
                  };
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.cardBorder),
                    ),
                    child: Row(
                      children: [
                        AvatarCircle(
                          size: 48,
                          gradientColors: [tagColors[room['tag']]!, tagColors[room['tag']]!.withValues(alpha: 0.6)],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(room['name']!, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 2),
                              Text('${room['host']} · ${room['tag']}', style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.people, color: AppColors.textMuted, size: 14),
                            const SizedBox(width: 4),
                            Text(room['count']!, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _chip(String label, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: active ? null : Border.all(color: AppColors.cardBorder),
      ),
      child: Text(label, style: TextStyle(color: active ? AppColors.textPrimary : AppColors.textMuted, fontSize: 13)),
    );
  }
}
