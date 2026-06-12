import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';
import '../../gifts/widgets/gift_sheet.dart';

class AudioRoomScreen extends StatelessWidget {
  const AudioRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2A1F4E), AppColors.background],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.textPrimary,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Midnight Jazz Lounge',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '38 listening',
                            style: TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _headerButton(Icons.share),
                    const SizedBox(width: 8),
                    _headerButton(Icons.more_horiz),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Host seat (big)
              const AvatarCircle(
                size: 70,
                gradientColors: [Color(0xFFFFD700), Color(0xFFB8860B)],
                borderColor: AppColors.gold,
                borderWidth: 3,
              ),
              const SizedBox(height: 6),
              const Text(
                'DJ Noor ✨',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              // Speaker grid (2 rows of 4)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _seatItem('Aria', const [Color(0xFF9C27B0), Color(0xFFE040FB)]),
                        _seatItem('Khalid', const [Color(0xFF00BCD4), Color(0xFF26C6DA)]),
                        _seatItem('Luna', const [Color(0xFFE91E63), Color(0xFFF48FB1)]),
                        _seatItem('Zain', const [Color(0xFF4CAF50), Color(0xFF81C784)]),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _seatItem('Nadia', const [Color(0xFFFF9800), Color(0xFFFFB74D)]),
                        _seatItem('Omar', const [Color(0xFF2196F3), Color(0xFF64B5F6)]),
                        _emptySeat(),
                        _emptySeat(),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Bottom section
              Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                decoration: BoxDecoration(
                  color: AppColors.surface.withOpacity(0.5),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    // Chat messages area
                    SizedBox(
                      height: 100,
                      child: ListView(
                        children: [
                          _chatMessage('Aria', 'Welcome everyone! 🎵'),
                          _chatMessage('Khalid', 'Great vibes tonight'),
                          _chatMessage('System', '🎁 Luna sent Rose to DJ Noor'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Bottom actions
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceLight,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Text(
                              'Say something...',
                              style: TextStyle(
                                color: AppColors.textMuted,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _actionButton(Icons.mic, AppColors.primary),
                        const SizedBox(width: 6),
                        _actionButton(Icons.emoji_emotions, AppColors.gold),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () => _showGiftSheet(context),
                          child: _actionButton(Icons.card_giftcard, AppColors.pink),
                        ),
                        const SizedBox(width: 6),
                        _actionButton(Icons.more_horiz, AppColors.textMuted),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showGiftSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const GiftSheet(),
    );
  }

  Widget _headerButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: AppColors.textSecondary, size: 18),
    );
  }

  Widget _seatItem(String name, List<Color> colors) {
    return Column(
      children: [
        AvatarCircle(size: 54, gradientColors: colors),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _emptySeat() {
    return Column(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surfaceLight.withOpacity(0.4),
            border: Border.all(
              color: AppColors.cardBorder,
              style: BorderStyle.solid,
            ),
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.textMuted,
            size: 20,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Empty',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _chatMessage(String name, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$name: ',
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: text,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.15),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
