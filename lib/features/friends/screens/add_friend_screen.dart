import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class AddFriendScreen extends StatelessWidget {
  const AddFriendScreen({super.key});

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
                  const Text('Add Friend', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(24), border: Border.all(color: AppColors.cardBorder)),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: AppColors.textMuted, size: 20),
                    SizedBox(width: 8),
                    Expanded(child: Text('Search by name or ID...', style: TextStyle(color: AppColors.textMuted, fontSize: 14))),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Quick actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: _quickAction(Icons.qr_code, 'My QR Code', AppColors.primary)),
                  const SizedBox(width: 12),
                  Expanded(child: _quickAction(Icons.contacts, 'Contacts', AppColors.teal)),
                  const SizedBox(width: 12),
                  Expanded(child: _quickAction(Icons.share, 'Invite', AppColors.pink)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft, child: Text('People You May Know', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600))),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _friendSuggestion('Yasmine', 'Lv.45 · 3 mutual friends', const [Color(0xFFE91E63), Color(0xFFF48FB1)]),
                  _friendSuggestion('Ahmed', 'Lv.38 · 5 mutual friends', const [Color(0xFF42A5F5), Color(0xFF90CAF9)]),
                  _friendSuggestion('Hana', 'Lv.52 · 2 mutual friends', const [Color(0xFFFF9800), Color(0xFFFFB74D)]),
                  _friendSuggestion('Rami', 'Lv.41 · 8 mutual friends', const [Color(0xFF4CAF50), Color(0xFF81C784)]),
                  _friendSuggestion('Dina', 'Lv.36 · 1 mutual friend', const [Color(0xFF00BCD4), Color(0xFF26C6DA)]),
                  _friendSuggestion('Faris', 'Lv.49 · 4 mutual friends', const [Color(0xFF7C5CBF), Color(0xFF9575CD)]),
                  _friendSuggestion('Lina', 'Lv.33 · 6 mutual friends', const [Color(0xFFFFD700), Color(0xFFFFA000)]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _quickAction(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(14), border: Border.all(color: color.withValues(alpha: 0.3))),
      child: Column(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  static Widget _friendSuggestion(String name, String subtitle, List<Color> colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.cardBorder)),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(14)),
            child: const Text('Add', style: TextStyle(color: AppColors.textPrimary, fontSize: 13, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
