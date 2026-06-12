import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: AppColors.textPrimary)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: AppColors.textMuted, size: 20),
                          SizedBox(width: 8),
                          Expanded(child: Text('Search users, rooms, clubs...', style: TextStyle(color: AppColors.textMuted, fontSize: 14))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Recent searches
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Recent Searches', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
                  Spacer(),
                  Text('Clear', style: TextStyle(color: AppColors.primary, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Recent search items
            ...['Midnight Jazz', 'Luna', 'Game Room'].map((term) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Row(
                children: [
                  const Icon(Icons.history, color: AppColors.textMuted, size: 18),
                  const SizedBox(width: 12),
                  Text(term, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                  const Spacer(),
                  const Icon(Icons.close, color: AppColors.textMuted, size: 16),
                ],
              ),
            )),
            const SizedBox(height: 24),
            // Popular
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Popular', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _resultItem('DJ Khalid', 'Host · 12.5K fans', const [Color(0xFFFFD700), Color(0xFFFFA000)]),
                  _resultItem('Luna Queen', 'VIP Gold · 8.2K fans', const [Color(0xFF9C27B0), Color(0xFFCE93D8)]),
                  _resultItem('Midnight Jazz 🎷', 'Room · 128 listeners', const [Color(0xFF7C5CBF), Color(0xFF9575CD)]),
                  _resultItem('Royal Stars', 'Club · 1,240 members', const [Color(0xFFE91E63), Color(0xFFF48FB1)]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _resultItem(String name, String subtitle, List<Color> colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          AvatarCircle(size: 44, gradientColors: colors),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                Text(subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textMuted, size: 20),
        ],
      ),
    );
  }
}
