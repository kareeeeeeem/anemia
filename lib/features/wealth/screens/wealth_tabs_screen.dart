import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/avatar_circle.dart';

class WealthTabsScreen extends StatefulWidget {
  const WealthTabsScreen({super.key});

  @override
  State<WealthTabsScreen> createState() => _WealthTabsScreenState();
}

class _WealthTabsScreenState extends State<WealthTabsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                  const Text('Wealth', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: AppColors.gold,
              unselectedLabelColor: AppColors.textMuted,
              indicatorColor: AppColors.gold,
              tabAlignment: TabAlignment.start,
              tabs: const [
                Tab(text: 'Send'),
                Tab(text: 'Receive'),
                Tab(text: 'Daily'),
                Tab(text: 'Weekly'),
                Tab(text: 'Monthly'),
                Tab(text: 'Total'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(6, (tabIndex) => _buildList()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    final users = [
      {'name': 'KingMidas', 'amount': '2.4M', 'level': 'Lv.58'},
      {'name': 'Queenie', 'amount': '1.8M', 'level': 'Lv.52'},
      {'name': 'DiamondHeart', 'amount': '1.2M', 'level': 'Lv.47'},
      {'name': 'GoldRush', 'amount': '980K', 'level': 'Lv.43'},
      {'name': 'RichBoy', 'amount': '750K', 'level': 'Lv.39'},
      {'name': 'LuxLife', 'amount': '620K', 'level': 'Lv.35'},
      {'name': 'BigSpender', 'amount': '480K', 'level': 'Lv.31'},
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: users.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final user = users[index];
        final rankColors = index == 0
            ? [const Color(0xFFFFD700), const Color(0xFFFFA000)]
            : index == 1
                ? [const Color(0xFFC0C0C0), const Color(0xFF9E9E9E)]
                : index == 2
                    ? [const Color(0xFFCD7F32), const Color(0xFF8D6E63)]
                    : [const Color(0xFF7C5CBF), const Color(0xFF9575CD)];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: index < 3 ? rankColors[0].withValues(alpha: 0.3) : AppColors.cardBorder),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 28,
                child: Text('${index + 1}', style: TextStyle(color: index < 3 ? rankColors[0] : AppColors.textMuted, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              AvatarCircle(size: 40, gradientColors: rankColors),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user['name']!, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                    Text(user['level']!, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                  ],
                ),
              ),
              Text('🪙 ${user['amount']}', style: const TextStyle(color: AppColors.gold, fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }
}
