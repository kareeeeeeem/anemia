import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class GameCenterScreen extends StatelessWidget {
  const GameCenterScreen({super.key});

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
                  GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: AppColors.textPrimary)),
                  const SizedBox(width: 16),
                  const Text('Game Center', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: AppColors.textMuted, size: 20),
                    SizedBox(width: 8),
                    Text('Search games...', style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Featured banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 120,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('🎰', style: TextStyle(fontSize: 36)),
                    SizedBox(height: 6),
                    Text('Lucky Wheel', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Spin & Win Big!', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Games section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Popular Games', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
                children: [
                  _gameCard('🎰', 'Lucky Wheel', AppColors.primary),
                  _gameCard('🎲', 'Dice Roll', AppColors.teal),
                  _gameCard('🃏', 'Card Match', AppColors.pink),
                  _gameCard('🎯', 'Target Hit', AppColors.orange),
                  _gameCard('🧩', 'Puzzle Rush', AppColors.green),
                  _gameCard('⚡', 'Speed Quiz', AppColors.gold),
                  _gameCard('🎪', 'Circus Fun', AppColors.red),
                  _gameCard('🏆', 'Trivia King', const Color(0xFF7C5CBF)),
                  _gameCard('🎮', 'Mini Arena', AppColors.teal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _gameCard(String emoji, String name, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Text(emoji, style: const TextStyle(fontSize: 26)),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
