import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class CpRankingsScreen extends StatelessWidget {
  const CpRankingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final couples = [
      {'name1': 'Luna', 'name2': 'Omar', 'score': '98,500', 'rank': 1},
      {'name1': 'Sara', 'name2': 'Ali', 'score': '87,200', 'rank': 2},
      {'name1': 'Nora', 'name2': 'Zain', 'score': '76,800', 'rank': 3},
      {'name1': 'Maya', 'name2': 'Kai', 'score': '65,400', 'rank': 4},
      {'name1': 'Layla', 'name2': 'Adam', 'score': '54,100', 'rank': 5},
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
                  const Text('CP Rankings', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  const Text('Rules', style: TextStyle(color: AppColors.primary, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Period
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
            // Top couple
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.pink.withValues(alpha: 0.15), AppColors.primary.withValues(alpha: 0.1)]),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.pink.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  const Text('👑', style: TextStyle(fontSize: 28)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AvatarCircle(size: 56, gradientColors: [Color(0xFFE91E63), Color(0xFFF48FB1)], borderColor: AppColors.pink, borderWidth: 2),
                      const SizedBox(width: 12),
                      const Text('❤️', style: TextStyle(fontSize: 22)),
                      const SizedBox(width: 12),
                      const AvatarCircle(size: 56, gradientColors: [Color(0xFF42A5F5), Color(0xFF90CAF9)], borderColor: AppColors.primary, borderWidth: 2),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('Luna & Omar', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
                  const Text('98,500 CP points', style: TextStyle(color: AppColors.pink, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: couples.length - 1,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final couple = couples[index + 1];
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.cardBorder),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 28, child: Text('${couple['rank']}', style: const TextStyle(color: AppColors.textMuted, fontSize: 16, fontWeight: FontWeight.bold))),
                        const AvatarCircle(size: 36, gradientColors: [Color(0xFFE91E63), Color(0xFFF48FB1)]),
                        const SizedBox(width: 4),
                        const Text('❤️', style: TextStyle(fontSize: 12)),
                        const SizedBox(width: 4),
                        const AvatarCircle(size: 36, gradientColors: [Color(0xFF42A5F5), Color(0xFF90CAF9)]),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${couple['name1']} & ${couple['name2']}', style: const TextStyle(color: AppColors.textPrimary, fontSize: 13, fontWeight: FontWeight.w600)),
                              Text('${couple['score']} pts', style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                            ],
                          ),
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

  static Widget _tab(String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: active ? AppColors.pink : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: TextStyle(color: active ? AppColors.textPrimary : AppColors.textMuted, fontSize: 13)),
    );
  }
}
