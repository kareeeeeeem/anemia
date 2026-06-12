import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class RoomGameLoadingScreen extends StatelessWidget {
  const RoomGameLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🎮', style: TextStyle(fontSize: 52)),
              const SizedBox(height: 20),
              const Text('Loading Game...', style: TextStyle(color: AppColors.textPrimary, fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Lucky Wheel', style: TextStyle(color: AppColors.primary, fontSize: 16)),
              const SizedBox(height: 32),
              // Players
              const Text('Players', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _playerSlot('You', const [Color(0xFF7C5CBF), Color(0xFF9575CD)], true),
                  const SizedBox(width: 20),
                  _playerSlot('Luna', const [Color(0xFFE91E63), Color(0xFFF48FB1)], true),
                  const SizedBox(width: 20),
                  _playerSlot('Omar', const [Color(0xFF42A5F5), Color(0xFF90CAF9)], true),
                  const SizedBox(width: 20),
                  _playerSlot('...', const [Color(0xFF424242), Color(0xFF616161)], false),
                ],
              ),
              const SizedBox(height: 40),
              // Loading indicator
              SizedBox(
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const LinearProgressIndicator(
                    backgroundColor: AppColors.surfaceLight,
                    valueColor: AlwaysStoppedAnimation(AppColors.primary),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Waiting for players...', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel', style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _playerSlot(String name, List<Color> colors, bool joined) {
    return Column(
      children: [
        AvatarCircle(
          size: 48,
          gradientColors: colors,
          borderColor: joined ? AppColors.green : null,
          borderWidth: 2,
        ),
        const SizedBox(height: 6),
        Text(name, style: TextStyle(color: joined ? AppColors.textPrimary : AppColors.textMuted, fontSize: 11)),
        if (joined)
          const Text('Ready', style: TextStyle(color: AppColors.green, fontSize: 10))
        else
          const Text('Waiting', style: TextStyle(color: AppColors.textMuted, fontSize: 10)),
      ],
    );
  }
}
