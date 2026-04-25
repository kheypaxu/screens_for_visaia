import 'package:flutter/material.dart';

void main() {
  runApp(const CroppingApp());
}

class CroppingApp extends StatelessWidget {
  const CroppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF9FBFB),
      ),
      home: const CroppingCyclesScreen(),
    );
  }
}

class CroppingCyclesScreen extends StatelessWidget {
  const CroppingCyclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      'Cropping Cycles',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900, // Extra Bold
                        color: Color(0xFF134E39),
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSearchBar(),
                    const SizedBox(height: 24),
                    _buildFilterRow(),
                    const SizedBox(height: 24),
                    const CropCycleCard(
                      title: 'Soybean Summer',
                      subtitle: 'Field Block 4B • 120 Acres',
                      progress: 0.65,
                      harvestDate: 'Oct 12',
                      statusText: 'High Moisture Risk',
                      statusColor: Color(0xFFC0392B),
                      statusIcon: Icons.warning_rounded,
                      progressColor: Color(0xFF134E39),
                      icon: Icons.grass,
                    ),
                    const SizedBox(height: 16),
                    const CropCycleCard(
                      title: 'Soybean Delta',
                      subtitle: 'River Tract 2 • 85 Acres',
                      progress: 0.30,
                      harvestDate: 'Nov 05',
                      statusText: 'Optimal Conditions',
                      statusColor: Color(0xFF27AE60),
                      statusIcon: Icons.check_circle,
                      progressColor: Color(0xFF134E39),
                      icon: Icons.eco,
                    ),
                    const SizedBox(height: 16),
                    const CropCycleCard(
                      title: 'Corn Hybrid X',
                      subtitle: 'North Ridge • 210 Acres',
                      progress: 0.85,
                      harvestDate: 'Sep 28',
                      statusText: 'Pest Alert Nearby',
                      statusColor: Color(0xFFF39C12),
                      statusIcon: Icons.info_outline,
                      progressColor: Color(0xFFF39C12),
                      icon: Icons.agriculture, // Corrected to lowercase
                    ),
                    const SizedBox(height: 32),
                    _buildActionButtons(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Row(
        children: [
          Icon(Icons.search, color: Color(0xFF5E6266), size: 24),
          SizedBox(width: 12),
          Text(
            'Search fields or crops...',
            style: TextStyle(color: Color(0xFFA1A5A8), fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2F2),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('Active',
                        style: TextStyle(color: Color(0xFF5E6266), fontWeight: FontWeight.w600)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Completed',
                        style: TextStyle(color: Color(0xFF134E39), fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE8ECEF)),
          ),
          child: const Row(
            children: [
              Icon(Icons.tune, size: 20, color: Color(0xFF1A1C1E)),
              SizedBox(width: 8),
              Text('Filters', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        _actionItem(
          icon: Icons.eco,
          title: 'Start New Cycle',
          subtitle: 'Monitor new cropping cycle',
          isPrimary: true,
        ),
        const SizedBox(height: 16),
        _actionItem(
          icon: Icons.shopping_basket_outlined,
          title: 'Record Previous Cycle',
          subtitle: 'Record yield and losses',
          isPrimary: false,
        ),
      ],
    );
  }

  Widget _actionItem({required IconData icon, required String title, required String subtitle, required bool isPrimary}) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF134E39) : Colors.white,
        borderRadius: BorderRadius.circular(40),
        border: isPrimary ? null : Border.all(color: const Color(0xFFE8ECEF)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isPrimary ? Colors.white.withValues(alpha:0.15) : const Color(0xFFF0F2F2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isPrimary ? Colors.white : const Color(0xFF134E39)),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                    color: isPrimary ? Colors.white : const Color(0xFF134E39),
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  )),
              Text(subtitle,
                  style: TextStyle(
                    color: isPrimary ? Colors.white.withValues(alpha:0.7) : const Color(0xFF5E6266),
                    fontSize: 14,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF0F2F2))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.shield_outlined, 'MITIGATION', false),
          _navItem(Icons.eco_outlined, 'HOME', false),
          _navItem(Icons.eco, 'CYCLE', true),
          _navItem(Icons.map_outlined, 'MAP', false),
          _navItem(Icons.person_outline, 'PROFILE', false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isActive 
          ? Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Color(0xFF134E39), shape: BoxShape.circle),
              child: Icon(icon, color: Colors.white, size: 22),
            )
          : Icon(icon, color: const Color(0xFFA1A5A8), size: 26),
        const SizedBox(height: 6),
        Text(label, 
          style: TextStyle(
            fontSize: 10, 
            fontWeight: FontWeight.w800,
            color: isActive ? const Color(0xFF134E39) : const Color(0xFFA1A5A8),
            letterSpacing: 0.2,
          )
        ),
      ],
    );
  }
}

class CropCycleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;
  final String harvestDate;
  final String statusText;
  final Color statusColor;
  final IconData statusIcon;
  final Color progressColor;
  final IconData icon;

  const CropCycleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.harvestDate,
    required this.statusText,
    required this.statusColor,
    required this.statusIcon,
    required this.progressColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.03),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: const Color(0xFFF0F2F2),
                      child: Icon(icon, color: const Color(0xFF134E39), size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: Color(0xFF1A1C1E))),
                          Text(subtitle,
                              style: const TextStyle(fontSize: 14, color: Color(0xFF5E6266), fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    const Icon(Icons.more_vert, color: Color(0xFF1A1C1E)),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('PROGRESS',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: Color(0xFF5E6266), letterSpacing: 1.0)),
                    Text('${(progress * 100).toInt()}%',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: progressColor)),
                  ],
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8ECEF),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: progressColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text('Est. Harvest: $harvestDate',
                    style: const TextStyle(fontSize: 13, color: Color(0xFF5E6266), fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              color: Color(0xFFF4F6F6),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: Row(
              children: [
                Icon(statusIcon, size: 18, color: statusColor),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    statusText,
                    style: TextStyle(fontSize: 14, color: statusColor, fontWeight: FontWeight.w700),
                  ),
                ),
                const Icon(Icons.arrow_forward, size: 18, color: Color(0xFF5E6266)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}