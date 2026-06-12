import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  children: [
                    GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: AppColors.textPrimary)),
                    const Spacer(),
                    const Icon(Icons.share, color: AppColors.textSecondary, size: 22),
                    const SizedBox(width: 16),
                    const Icon(Icons.more_vert, color: AppColors.textSecondary, size: 22),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Avatar and info
              const AvatarCircle(size: 90, gradientColors: [Color(0xFF7C5CBF), Color(0xFF9575CD)], borderColor: AppColors.primary, borderWidth: 3),
              const SizedBox(height: 12),
              const Text('Ahmed', style: TextStyle(color: AppColors.textPrimary, fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('ID: 1234567', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(color: AppColors.gold.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(10)),
                    child: const Text('VIP 5', style: TextStyle(color: AppColors.gold, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(10)),
                    child: const Text('Lv.52', style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Bio
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Music lover 🎵 | Voice room host | Living the dream ✨',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4),
                ),
              ),
              const SizedBox(height: 20),
              // Stats
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(child: _statItem('Followers', '12.5K')),
                    Container(width: 1, height: 30, color: AppColors.cardBorder),
                    Expanded(child: _statItem('Following', '856')),
                    Container(width: 1, height: 30, color: AppColors.cardBorder),
                    Expanded(child: _statItem('Friends', '234')),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Action buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Edit Profile', style: TextStyle(color: AppColors.textPrimary, fontSize: 14)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.cardBorder)),
                      child: const Icon(Icons.settings, color: AppColors.textSecondary, size: 22),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Menu grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                  children: [
                    _menuItem('🎒', 'My Bag', AppColors.orange),
                    _menuItem('🏅', 'Medals', AppColors.gold),
                    _menuItem('💎', 'Wallet', const Color(0xFF42A5F5)),
                    _menuItem('🎮', 'Games', AppColors.teal),
                    _menuItem('❤️', 'CP', AppColors.pink),
                    _menuItem('🏆', 'Titles', AppColors.primary),
                    _menuItem('📊', 'Level', AppColors.green),
                    _menuItem('🎁', 'Rewards', AppColors.red),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _statItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
      ],
    );
  }

  static Widget _menuItem(String emoji, String label, Color color) {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.cardBorder)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
        ],
      ),
    );
  }
}
