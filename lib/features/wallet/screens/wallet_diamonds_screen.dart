import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class WalletDiamondsScreen extends StatelessWidget {
  const WalletDiamondsScreen({super.key});

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
                  const Text('Wallet', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Balance cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: _balanceCard('💎', 'Diamonds', '3,240', const Color(0xFF42A5F5))),
                  const SizedBox(width: 12),
                  Expanded(child: _balanceCard('🪙', 'Coins', '12,480', AppColors.gold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: _actionBtn('Top Up', Icons.add_circle_outline, AppColors.green)),
                  const SizedBox(width: 12),
                  Expanded(child: _actionBtn('Withdraw', Icons.arrow_downward, AppColors.orange)),
                  const SizedBox(width: 12),
                  Expanded(child: _actionBtn('Transfer', Icons.swap_horiz, AppColors.primary)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Transaction History', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _txItem('Gift sent to Luna', '-50 💎', 'Today 2:30 PM', AppColors.red),
                  _txItem('Top up completed', '+500 💎', 'Today 1:15 PM', AppColors.green),
                  _txItem('Received from Khalid', '+25 💎', 'Yesterday 9:00 PM', AppColors.green),
                  _txItem('VIP Subscription', '-200 🪙', 'Yesterday 3:45 PM', AppColors.red),
                  _txItem('Daily reward', '+10 💎', 'Apr 2, 10:00 AM', AppColors.green),
                  _txItem('Gift sent to Omar', '-100 🪙', 'Apr 1, 8:30 PM', AppColors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _balanceCard(String emoji, String label, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$emoji $label', style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
          const SizedBox(height: 8),
          Text(amount, style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  static Widget _actionBtn(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
        ],
      ),
    );
  }

  static Widget _txItem(String title, String amount, String time, Color amountColor) {
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(time, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
              ],
            ),
          ),
          Text(amount, style: TextStyle(color: amountColor, fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
