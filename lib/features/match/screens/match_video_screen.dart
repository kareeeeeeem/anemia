import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class MatchVideoScreen extends StatelessWidget {
  const MatchVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Dark background with subtle arc
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -0.3),
                radius: 1.2,
                colors: [Color(0xFF1A1740), AppColors.background],
              ),
            ),
          ),
          // Arc decoration
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: -50,
            right: -50,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.surfaceLight.withOpacity(0.3),
                  width: 1,
                ),
              ),
            ),
          ),
          SafeArea(
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
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLight,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.cardBorder),
                        ),
                        child: const Row(
                          children: [
                            Text('🌕', style: TextStyle(fontSize: 14)),
                            SizedBox(width: 4),
                            Text(
                              '0',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.add, color: AppColors.textPrimary, size: 16),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.star, color: AppColors.textPrimary, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'Plus',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Side buttons
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        _sideButton(Icons.person_add, null),
                        const SizedBox(height: 12),
                        _sideButton(Icons.grid_view, null),
                        const SizedBox(height: 12),
                        _sideButton(Icons.refresh, null),
                        const SizedBox(height: 12),
                        _sideButton(Icons.phone, null),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Click to start
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'Click anywhere to start',
                        style: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 12),
                      AvatarCircle(
                        size: 50,
                        gradientColors: [
                          AppColors.surfaceLight,
                          AppColors.surfaceLight,
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Bottom filters
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _filterButton('Gender', 'Any ^', AppColors.pink, Icons.female),
                      _filterButton('Country', 'Any ^', AppColors.teal, Icons.language),
                      _filterButton('Identity', 'Any ^', AppColors.gold, Icons.badge),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideButton(IconData icon, Color? color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: color ?? AppColors.textSecondary,
        size: 22,
      ),
    );
  }

  Widget _filterButton(String label, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 14),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            value,
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
