import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class InvitationRewardsScreen extends StatelessWidget {
  const InvitationRewardsScreen({super.key});

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
                  const Text('Invitation Rewards', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Share code
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1A237E), Color(0xFF283593)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text('🎉', style: TextStyle(fontSize: 36)),
                  const SizedBox(height: 8),
                  const Text('Invite Friends & Earn', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Share your code and both get rewards!', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white.withValues(alpha: 0.2))),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('VOICE2024', style: TextStyle(color: AppColors.gold, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2)),
                        SizedBox(width: 12),
                        Icon(Icons.copy, color: AppColors.textSecondary, size: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      child: const Text('Share Invite Link', style: TextStyle(color: AppColors.textPrimary, fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: _statCard('12', 'Invited', AppColors.primary)),
                  const SizedBox(width: 12),
                  Expanded(child: _statCard('6,000', 'Earned', AppColors.gold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft, child: Text('Reward Tiers', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600))),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _rewardTier('Invite 1 friend', '500 coins', true),
                  _rewardTier('Invite 5 friends', '3,000 coins', true),
                  _rewardTier('Invite 10 friends', '8,000 coins', true),
                  _rewardTier('Invite 20 friends', '20,000 coins', false),
                  _rewardTier('Invite 50 friends', '60,000 coins', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _statCard(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.cardBorder)),
      child: Column(
        children: [
          Text(value, style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
        ],
      ),
    );
  }

  static Widget _rewardTier(String requirement, String reward, bool claimed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14), border: Border.all(color: claimed ? AppColors.green.withValues(alpha: 0.3) : AppColors.cardBorder)),
      child: Row(
        children: [
          Text(claimed ? '✅' : '⭕', style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(requirement, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w500)),
                Text('🪙 $reward', style: const TextStyle(color: AppColors.gold, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: claimed ? AppColors.textMuted.withValues(alpha: 0.2) : AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(claimed ? 'Claimed' : 'Claim', style: TextStyle(color: claimed ? AppColors.textMuted : AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
