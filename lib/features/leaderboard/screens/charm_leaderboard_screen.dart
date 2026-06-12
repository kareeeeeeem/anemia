import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class CharmLeaderboardScreen extends StatelessWidget {
  const CharmLeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      {'name': 'Luna', 'charm': '98,500', 'level': 'Lv.52'},
      {'name': 'Yasmine', 'charm': '87,200', 'level': 'Lv.48'},
      {'name': 'Nora', 'charm': '76,800', 'level': 'Lv.45'},
      {'name': 'Sara', 'charm': '65,400', 'level': 'Lv.42'},
      {'name': 'Maya', 'charm': '54,100', 'level': 'Lv.39'},
      {'name': 'Hana', 'charm': '43,200', 'level': 'Lv.36'},
      {'name': 'Dina', 'charm': '32,800', 'level': 'Lv.33'},
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
                  const Text('Charm Leaderboard', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  const Icon(Icons.info_outline, color: AppColors.textMuted, size: 22),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _tab('Daily', false),
                  const SizedBox(width: 10),
                  _tab('Weekly', true),
                  const SizedBox(width: 10),
                  _tab('Monthly', false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Top 3
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.pink.withValues(alpha: 0.12), AppColors.background]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _podium('Yasmine', '87.2K', 2, const Color(0xFFC0C0C0)),
                  _podium('Luna', '98.5K', 1, const Color(0xFFFFD700)),
                  _podium('Nora', '76.8K', 3, const Color(0xFFCD7F32)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: users.length - 3,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final user = users[index + 3];
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.cardBorder)),
                    child: Row(
                      children: [
                        SizedBox(width: 28, child: Text('${index + 4}', style: const TextStyle(color: AppColors.textMuted, fontSize: 16, fontWeight: FontWeight.bold))),
                        AvatarCircle(size: 40, gradientColors: const [Color(0xFFE91E63), Color(0xFFF48FB1)]),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user['name']!, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                              Text(user['level']!, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                            ],
                          ),
                        ),
                        Text('💖 ${user['charm']}', style: const TextStyle(color: AppColors.pink, fontSize: 14, fontWeight: FontWeight.bold)),
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
      decoration: BoxDecoration(color: active ? AppColors.pink : AppColors.surface, borderRadius: BorderRadius.circular(16)),
      child: Text(label, style: TextStyle(color: active ? AppColors.textPrimary : AppColors.textMuted, fontSize: 13)),
    );
  }

  static Widget _podium(String name, String score, int rank, Color color) {
    final size = rank == 1 ? 60.0 : 48.0;
    return Column(
      children: [
        if (rank == 1) const Text('👑', style: TextStyle(fontSize: 20)),
        AvatarCircle(size: size, gradientColors: [const Color(0xFFE91E63), const Color(0xFFF48FB1)], borderColor: color, borderWidth: 2),
        const SizedBox(height: 6),
        Text(name, style: const TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w600)),
        Text(score, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
