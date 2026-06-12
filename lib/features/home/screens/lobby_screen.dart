import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Live Rooms',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '124 online',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: const Row(
                  children: [
                    Text('🔍', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 10),
                    Text(
                      'Search rooms...',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            // Category chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _categoryChip('All', true),
                  const SizedBox(width: 8),
                  _categoryChip('Public', false),
                  const SizedBox(width: 8),
                  _categoryChip('Private', false),
                  const SizedBox(width: 8),
                  _categoryChip('🎵 Music', false),
                  const SizedBox(width: 8),
                  _categoryChip('🎮 Game', false),
                ],
              ),
            ),
            const SizedBox(height: 14),
            // Room grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
                children: [
                  _roomCard(
                    name: 'Midnight Jazz',
                    emoji: '🎵',
                    online: 38,
                    isLive: true,
                    isPublic: true,
                    gradientColors: const [Color(0xFF4A2040), Color(0xFF1A1040)],
                  ),
                  _roomCard(
                    name: 'Night Talks VIP',
                    emoji: '🌙',
                    online: 12,
                    isLive: true,
                    isPublic: false,
                    gradientColors: const [Color(0xFF1A3040), Color(0xFF0A2030)],
                  ),
                  _roomCard(
                    name: 'Open Mic Night',
                    emoji: '🎤',
                    online: 71,
                    isLive: true,
                    isPublic: true,
                    gradientColors: const [Color(0xFF3A1A1A), Color(0xFF1A0A0A)],
                  ),
                  _roomCard(
                    name: 'Gaming Café',
                    emoji: '🎮',
                    online: 44,
                    isLive: true,
                    isPublic: true,
                    gradientColors: const [Color(0xFF1A3020), Color(0xFF0A2010)],
                  ),
                  _roomCard(
                    name: 'Chill & Relax',
                    emoji: '🌸',
                    online: 9,
                    isLive: true,
                    isPublic: false,
                    gradientColors: const [Color(0xFF3A2020), Color(0xFF1A1010)],
                  ),
                  _roomCard(
                    name: 'Galaxy Beats',
                    emoji: '🖼️',
                    online: 55,
                    isLive: true,
                    isPublic: true,
                    gradientColors: const [Color(0xFF1A2040), Color(0xFF0A1030)],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryChip(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.pink : AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: isActive ? null : Border.all(color: AppColors.cardBorder),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _roomCard({
    required String name,
    required String emoji,
    required int online,
    required bool isLive,
    required bool isPublic,
    required List<Color> gradientColors,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
          border: Border.all(color: AppColors.cardBorder.withOpacity(0.5)),
        ),
        child: Stack(
          children: [
            // Center emoji
            Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 48),
              ),
            ),
            // LIVE badge
            if (isLive)
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.red.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, color: AppColors.textPrimary, size: 6),
                      SizedBox(width: 3),
                      Text(
                        'LIVE',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            // Public/Private badge
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isPublic
                      ? AppColors.teal.withOpacity(0.8)
                      : AppColors.surfaceLight.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  isPublic ? 'Public' : 'Private',
                  style: TextStyle(
                    color: isPublic ? AppColors.textPrimary : AppColors.textSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Bottom info
            Positioned(
              bottom: 10,
              left: 12,
              right: 12,
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
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.green,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$online online',
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
