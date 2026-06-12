import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class GameRankingsScreen extends StatelessWidget {
  const GameRankingsScreen({super.key});

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
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                  ),
                  const SizedBox(width: 16),
                  const Text('Game Rankings', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  const Icon(Icons.info_outline, color: AppColors.textMuted, size: 22),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Period selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _periodTab('Daily', true),
                  const SizedBox(width: 10),
                  _periodTab('Weekly', false),
                  const SizedBox(width: 10),
                  _periodTab('Monthly', false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 8,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final names = ['StarKing', 'NovaBlade', 'LunaFox', 'SkyHero', 'IceQueen', 'DarkWolf', 'FireBird', 'GoldEagle'];
                  final scores = ['98,500', '87,200', '76,800', '65,400', '54,100', '43,200', '32,800', '21,500'];
                  final colors = [
                    [const Color(0xFFFFD700), const Color(0xFFFFA000)],
                    [const Color(0xFFC0C0C0), const Color(0xFF9E9E9E)],
                    [const Color(0xFFCD7F32), const Color(0xFF8D6E63)],
                    [const Color(0xFF7C5CBF), const Color(0xFF9575CD)],
                    [const Color(0xFF00BCD4), const Color(0xFF26C6DA)],
                    [const Color(0xFFE91E63), const Color(0xFFF48FB1)],
                    [const Color(0xFFFF9800), const Color(0xFFFFB74D)],
                    [const Color(0xFF4CAF50), const Color(0xFF81C784)],
                  ];
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: index < 3 ? colors[index][0].withValues(alpha: 0.4) : AppColors.cardBorder),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 28,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: index < 3 ? colors[index][0] : AppColors.textMuted,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        AvatarCircle(size: 40, gradientColors: colors[index]),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(names[index], style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                              Text('Score: ${scores[index]}', style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                            ],
                          ),
                        ),
                        const Text('🎮', style: TextStyle(fontSize: 18)),
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

  static Widget _periodTab(String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: TextStyle(color: active ? AppColors.textPrimary : AppColors.textMuted, fontSize: 13)),
    );
  }
}
