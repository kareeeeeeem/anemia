import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../feed/screens/dynamic_feed_screen.dart';
import '../../match/screens/match_video_screen.dart';
import '../../messages/screens/messages_screen.dart';
import 'party_lobby_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    PartyLobbyScreen(),
    _PlaceholderScreen(icon: Icons.play_arrow, label: 'Play'),
    MatchVideoScreen(),
    DynamicFeedScreen(),
    MessagesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          border: Border(
            top: BorderSide(color: AppColors.cardBorder, width: 0.5),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(0, Icons.home, 'Home'),
                _navItem(1, Icons.play_arrow, 'Play'),
                _heartNavItem(),
                _navItem(3, Icons.camera_alt, 'Feed'),
                _navItem(4, Icons.chat_bubble, 'Chat'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Icon(
          icon,
          color: isActive ? AppColors.navActive : AppColors.navInactive,
          size: 26,
        ),
      ),
    );
  }

  Widget _heartNavItem() {
    final isActive = _currentIndex == 2;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = 2),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColors.teal : AppColors.surfaceLight,
        ),
        child: Icon(
          Icons.favorite,
          color: isActive ? AppColors.textPrimary : AppColors.navInactive,
          size: 22,
        ),
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PlaceholderScreen({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.textMuted, size: 48),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
