import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class ClubRankingsScreen extends StatelessWidget {
  const ClubRankingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clubs = [
      {'name': 'Royal Stars', 'members': '1,240', 'score': '458K', 'rank': 1},
      {'name': 'Night Owls', 'members': '980', 'score': '392K', 'rank': 2},
      {'name': 'Diamond Elite', 'members': '870', 'score': '345K', 'rank': 3},
      {'name': 'Golden Empire', 'members': '760', 'score': '298K', 'rank': 4},
      {'name': 'Moonlight', 'members': '650', 'score': '254K', 'rank': 5},
      {'name': 'Sunrise Club', 'members': '540', 'score': '210K', 'rank': 6},
      {'name': 'Thunder Bolt', 'members': '430', 'score': '176K', 'rank': 7},
    ];

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
                  const Text('Club Rankings', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _tab('Weekly', true),
                  const SizedBox(width: 10),
                  _tab('Monthly', false),
                  const SizedBox(width: 10),
                  _tab('All Time', false),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Top 3 podium
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.primary.withValues(alpha: 0.15), AppColors.background]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _podiumItem('Night Owls', '392K', 2, const Color(0xFFC0C0C0)),
                  _podiumItem('Royal Stars', '458K', 1, const Color(0xFFFFD700)),
                  _podiumItem('Diamond Elite', '345K', 3, const Color(0xFFCD7F32)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: clubs.length - 3,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final club = clubs[index + 3];
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.cardBorder),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 28, child: Text('${club['rank']}', style: const TextStyle(color: AppColors.textMuted, fontSize: 16, fontWeight: FontWeight.bold))),
                        AvatarCircle(size: 40, gradientColors: const [Color(0xFF7C5CBF), Color(0xFF9575CD)]),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(club['name'] as String, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                              Text('${club['members']} members', style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                            ],
                          ),
                        ),
                        Text(club['score'] as String, style: const TextStyle(color: AppColors.gold, fontSize: 14, fontWeight: FontWeight.bold)),
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

  static Widget _tab(String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: TextStyle(color: active ? AppColors.textPrimary : AppColors.textMuted, fontSize: 13)),
    );
  }

  static Widget _podiumItem(String name, String score, int rank, Color color) {
    final size = rank == 1 ? 60.0 : 48.0;
    return Column(
      children: [
        if (rank == 1) const Text('👑', style: TextStyle(fontSize: 22)),
        AvatarCircle(size: size, gradientColors: [color, color.withValues(alpha: 0.7)], borderColor: color, borderWidth: 2),
        const SizedBox(height: 6),
        Text(name, style: const TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w600)),
        Text(score, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
