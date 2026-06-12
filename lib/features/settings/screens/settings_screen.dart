import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                  const Text('Settings', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  // Account section
                  _sectionTitle('ACCOUNT'),
                  _settingItem(Icons.person_outline, 'Account & Security', null),
                  _settingItem(Icons.lock_outline, 'Privacy', null),
                  _settingItem(Icons.block, 'Blocked Users', '3'),
                  const SizedBox(height: 20),
                  // Notifications section
                  _sectionTitle('NOTIFICATIONS'),
                  _settingItem(Icons.notifications_outlined, 'Push Notifications', null),
                  _settingItem(Icons.volume_up_outlined, 'Sound & Vibration', null),
                  _settingItem(Icons.do_not_disturb_outlined, 'Do Not Disturb', null),
                  const SizedBox(height: 20),
                  // General section
                  _sectionTitle('GENERAL'),
                  _settingItem(Icons.language, 'Language', 'English'),
                  _settingItem(Icons.dark_mode_outlined, 'Theme', 'Dark'),
                  _settingItem(Icons.storage_outlined, 'Storage', '256 MB'),
                  _settingItem(Icons.cached, 'Clear Cache', null),
                  const SizedBox(height: 20),
                  // Support section
                  _sectionTitle('SUPPORT'),
                  _settingItem(Icons.help_outline, 'Help Center', null),
                  _settingItem(Icons.info_outline, 'About', 'v1.0.0'),
                  _settingItem(Icons.description_outlined, 'Terms & Privacy', null),
                  _settingItem(Icons.feedback_outlined, 'Feedback', null),
                  const SizedBox(height: 24),
                  // Logout
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.red),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      child: const Text('Log Out', style: TextStyle(color: AppColors.red, fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: const TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1)),
    );
  }

  static Widget _settingItem(IconData icon, String title, String? value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.cardBorder, width: 0.5))),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textSecondary, size: 22),
          const SizedBox(width: 14),
          Expanded(child: Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 15))),
          if (value != null) ...[
            Text(value, style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
            const SizedBox(width: 4),
          ],
          const Icon(Icons.chevron_right, color: AppColors.textMuted, size: 20),
        ],
      ),
    );
  }
}
