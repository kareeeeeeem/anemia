import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class GetDiamondsScreen extends StatefulWidget {
  const GetDiamondsScreen({super.key});

  @override
  State<GetDiamondsScreen> createState() => _GetDiamondsScreenState();
}

class _GetDiamondsScreenState extends State<GetDiamondsScreen> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> _options = [
    {'diamonds': 50, 'price': '\$0.99'},
    {'diamonds': 150, 'price': '\$2.99'},
    {'diamonds': 500, 'price': '\$7.99'},
    {'diamonds': 1000, 'price': '\$14.99'},
    {'diamonds': 2500, 'price': '\$29.99'},
    {'diamonds': 5000, 'price': '\$49.99'},
    {'diamonds': 10000, 'price': '\$89.99'},
    {'diamonds': 25000, 'price': '\$199.99'},
  ];

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
                  const Text('Get Diamonds', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Current balance
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1A237E), Color(0xFF0D47A1)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Diamonds', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Text('💎', style: TextStyle(fontSize: 24)),
                          SizedBox(width: 8),
                          Text('3,240', style: TextStyle(color: AppColors.textPrimary, fontSize: 28, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('History', style: TextStyle(color: AppColors.textPrimary, fontSize: 13)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.2,
                ),
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  final opt = _options[index];
                  final isSelected = _selectedIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: isSelected ? const Color(0xFF42A5F5) : AppColors.cardBorder, width: isSelected ? 2 : 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('💎', style: TextStyle(fontSize: 26)),
                          const SizedBox(height: 6),
                          Text('${opt['diamonds']}', style: const TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(opt['price'] as String, style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF42A5F5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Purchase', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
