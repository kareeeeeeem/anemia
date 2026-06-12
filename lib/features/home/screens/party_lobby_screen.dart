import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class PartyLobbyScreen extends StatelessWidget {
  const PartyLobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Party',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.inventory_2_outlined,
                      color: AppColors.textSecondary,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            // Underline
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 50,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.teal,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Filter tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _filterChip('My', false),
                  const SizedBox(width: 8),
                  _filterChip('Hot', true),
                  const SizedBox(width: 8),
                  _filterChip('New', false),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: AppColors.textSecondary,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _filterChip('Search', false),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Room list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _roomCard(
                    name: '❤️🔥🏃 لحالي اريح',
                    tag: 'Agency',
                    tagColor: AppColors.teal,
                    subtitle: 'SABIR',
                    listeners: '35.31K',
                    borderColor: AppColors.teal,
                  ),
                  const SizedBox(height: 12),
                  _roomCard(
                    name: '💕وكالة السلطانه...',
                    tag: 'Singing',
                    tagColor: AppColors.pink,
                    subtitle: '🎊🎊 يوجد شحن',
                    listeners: '12.62K',
                    borderColor: AppColors.pink,
                  ),
                  const SizedBox(height: 12),
                  // Beans banner
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, Color(0xFF5A3D9E)],
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 20,
                          bottom: 20,
                          child: Text(
                            'Beans',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 15,
                          child: Icon(
                            Icons.games,
                            color: AppColors.textPrimary.withOpacity(0.6),
                            size: 50,
                          ),
                        ),
                        // Sparkles
                        ...List.generate(3, (i) {
                          return Positioned(
                            left: 60.0 + i * 80,
                            top: 15.0 + i * 10,
                            child: Icon(
                              Icons.auto_awesome,
                              color: AppColors.textPrimary.withOpacity(0.3),
                              size: 12,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  _roomCard(
                    name: 'احلي صباح من احل..',
                    tag: 'Singing',
                    tagColor: AppColors.pink,
                    subtitle: 'welcome to my room',
                    listeners: '2.34K',
                    borderColor: AppColors.pink,
                  ),
                  const SizedBox(height: 12),
                  _roomCard(
                    name: 'وكهالة الاخهوا...',
                    tag: 'Agency',
                    tagColor: AppColors.teal,
                    subtitle: 'تسجيل',
                    listeners: '741',
                    borderColor: AppColors.teal,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            // Join party button
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('🎉', style: TextStyle(fontSize: 20)),
                      SizedBox(width: 8),
                      Text(
                        'Join party',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterChip(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.green : AppColors.surfaceLight,
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

  Widget _roomCard({
    required String name,
    required String tag,
    required Color tagColor,
    required String subtitle,
    required String listeners,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.graphic_eq, color: tagColor, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    listeners,
                    style: TextStyle(
                      color: tagColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: tagColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: tagColor.withOpacity(0.4)),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: tagColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
