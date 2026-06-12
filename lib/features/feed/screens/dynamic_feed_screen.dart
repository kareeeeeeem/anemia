import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class DynamicFeedScreen extends StatelessWidget {
  const DynamicFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AvatarCircle(
                    size: 40,
                    gradientColors: [AppColors.pink, Color(0xFFE040FB)],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Dynamic',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.teal,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Color(0xFFFFD700),
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Filter tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _tabChip('Follow', false),
                  const SizedBox(width: 8),
                  _tabChip('New', true),
                  const SizedBox(width: 8),
                  _tabChip('Global', false),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Feed content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _feedPost(),
                  const SizedBox(height: 16),
                  _feedPost(
                    name: 'Mohamed',
                    text: 'Welcome everyone to my room tonight! 🎤',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.teal,
        child: const Icon(Icons.edit, color: AppColors.textPrimary),
      ),
    );
  }

  Widget _tabChip(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.pink : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(20),
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

  Widget _feedPost({
    String name = 'الزعيمة 🌟',
    String text = '#حين قالت مريم العذراء\nياليتني مت قبل هذا وكنت نسياً منسياً\n\nكانت تخبر النساء بأن الشرف والحياء\n#الاغلى من الحياة نفسها\n#لا زلت احاول الان افهم\nماذا رأى موسى عليه السلام من فتاة',
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AvatarCircle(
                size: 44,
                gradientColors: [AppColors.pink, Color(0xFFCE93D8)],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const AvatarCircle(
                      size: 12,
                      gradientColors: [AppColors.pink, AppColors.red],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: const Text(
                  '+ Follow',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildRichText(text),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              _hashtagChip('#الحياء'),
              _hashtagChip('#المرأة'),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '✨ ⚡',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildRichText(String text) {
    final lines = text.split('\n');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        final isHashtag = line.startsWith('#');
        return Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            line,
            style: TextStyle(
              color: isHashtag ? AppColors.primary : AppColors.textPrimary,
              fontSize: 14,
              height: 1.5,
            ),
            textDirection: TextDirection.rtl,
          ),
        );
      }).toList(),
    );
  }

  Widget _hashtagChip(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.primary.withOpacity(0.5)),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 12,
        ),
      ),
    );
  }
}
