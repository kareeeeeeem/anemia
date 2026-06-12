import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

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
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  _tabItem('Wealth', true),
                  const SizedBox(width: 20),
                  _tabItem('Charm', false),
                  const SizedBox(width: 20),
                  _tabItem('Room', false),
                  const Spacer(),
                  const AvatarCircle(
                    size: 32,
                    gradientColors: [AppColors.surfaceLight, AppColors.surfaceLight],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Period selector
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _periodChip('Daily', false),
                const SizedBox(width: 8),
                _periodChip('Weekly', true),
                const SizedBox(width: 8),
                _periodChip('Month', false),
              ],
            ),
            const SizedBox(height: 16),
            // Top 3 podium
            Container(
              height: 220,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF3D2E0A), Color(0xFF1A1400)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // 2nd place (left)
                  Positioned(
                    left: 20,
                    bottom: 30,
                    child: _podiumItem(
                      rank: 2,
                      name: 'موسيقى.ح...',
                      amount: '12.45M 🪙',
                      size: 60,
                      colors: const [Color(0xFF7986CB), Color(0xFF5C6BC0)],
                    ),
                  ),
                  // 1st place (center)
                  Positioned(
                    bottom: 50,
                    child: _podiumItem(
                      rank: 1,
                      name: 'ابو تالا',
                      amount: '22.06M 🪙',
                      size: 75,
                      colors: const [Color(0xFF5C6BC0), Color(0xFF3F51B5)],
                    ),
                  ),
                  // 3rd place (right)
                  Positioned(
                    right: 20,
                    bottom: 30,
                    child: _podiumItem(
                      rank: 3,
                      name: 'MANGE...',
                      amount: '11.91M 🪙',
                      size: 55,
                      colors: const [Color(0xFF66BB6A), Color(0xFF4CAF50)],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _leaderItem(4, 'Ali', 'Weekly Top Gifter', '11.38M 🪙',
                      const [Color(0xFF5C6BC0), Color(0xFF7986CB)]),
                  const SizedBox(height: 8),
                  _leaderItem(5, 'Farasha 🇪🇬', 'Weekly Top Gifter', '8.02M 🪙',
                      const [Color(0xFF7986CB), Color(0xFF9FA8DA)]),
                  const SizedBox(height: 8),
                  _leaderItem(6, 'Unknown 🇸🇦', 'Weekly Top Gifter', '5.97M 🪙',
                      const [Color(0xFF5C6BC0), Color(0xFF7986CB)]),
                  const SizedBox(height: 8),
                  _leaderItem(7, 'نجم لوح', 'Weekly Top Gifter', '5.93M 🪙',
                      const [Color(0xFF9C27B0), Color(0xFFBA68C8)]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabItem(String label, bool isActive) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: isActive ? AppColors.textPrimary : AppColors.textMuted,
            fontSize: 16,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
          ),
        ),
        if (isActive)
          Container(
            width: 30,
            height: 3,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
      ],
    );
  }

  Widget _periodChip(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? AppColors.pink : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.textPrimary : AppColors.textMuted,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _podiumItem({
    required int rank,
    required String name,
    required String amount,
    required double size,
    required List<Color> colors,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            AvatarCircle(
              size: size,
              gradientColors: colors,
              borderColor: rank == 1 ? AppColors.gold : AppColors.cardBorder,
              borderWidth: 2,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: rank == 1
                      ? AppColors.gold
                      : rank == 2
                          ? Colors.grey
                          : AppColors.orange,
                ),
                child: Center(
                  child: Text(
                    '$rank',
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          amount,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _leaderItem(int rank, String name, String subtitle, String amount,
      List<Color> colors) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.gold.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 28,
            child: Text(
              '$rank',
              style: const TextStyle(
                color: AppColors.gold,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AvatarCircle(size: 44, gradientColors: colors),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
