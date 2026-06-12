import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class RankingRulesPopupScreen extends StatelessWidget {
  const RankingRulesPopupScreen({super.key});

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
                  const Text('Ranking Rules', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _ruleSection('📊 How Rankings Work', [
                    'Rankings are calculated based on your activity score',
                    'Scores are updated in real-time throughout the day',
                    'Rankings reset at the start of each period (daily/weekly/monthly)',
                  ]),
                  const SizedBox(height: 16),
                  _ruleSection('🪙 Earning Points', [
                    'Sending gifts: 1 point per coin spent',
                    'Receiving gifts: 1 point per coin received',
                    'Hosting rooms: 50 points per hour',
                    'Playing games: 10 points per game',
                  ]),
                  const SizedBox(height: 16),
                  _ruleSection('🏆 Rewards', [
                    'Top 1: 50,000 coins + Exclusive frame (7 days)',
                    'Top 2-3: 20,000 coins + Special badge',
                    'Top 4-10: 10,000 coins',
                    'Top 11-50: 5,000 coins',
                  ]),
                  const SizedBox(height: 16),
                  _ruleSection('📋 Rules', [
                    'Only legitimate activities count towards rankings',
                    'Any cheating will result in disqualification',
                    'Rewards are distributed within 24 hours after period ends',
                    'VoiceRoom reserves the right to modify rules',
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _ruleSection(String title, List<String> items) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(color: AppColors.primary, fontSize: 14)),
                Expanded(child: Text(item, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
