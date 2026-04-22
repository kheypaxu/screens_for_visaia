import 'package:flutter/material.dart';

void main() {
  runApp(const VerdantHarvestApp());
}

class VerdantHarvestApp extends StatelessWidget {
  const VerdantHarvestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8FAF7),
        fontFamily: 'SF Pro Display', // Standard system font or Roboto
      ),
      home: const AccountSecurityScreen(),
    );
  }
}

class AppColors {
  static const Color background = Color(0xFFF8FAF7);
  static const Color primaryGreen = Color(0xFF1D3305);
  static const Color warningRed = Color(0xFFD32F2F);
  static const Color criticalBadge = Color(0xFFFDE8E8);
  static const Color textBody = Color(0xFF555555);
  static const Color cardGrey1 = Color(0xFFF1F4F1);
  static const Color cardGrey2 = Color(0xFFF0F2EF);
}

class AccountSecurityScreen extends StatelessWidget {
  const AccountSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Account Security',
          style: TextStyle(
            color: Color(0xFF1D3305),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Progress Indicator
            Row(
              children: [
                Container(
                  height: 6,
                  width: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 6,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const Spacer(),
                Text(
                  'STEP 01 OF 02',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Critical Action Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.criticalBadge,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber_rounded, color: AppColors.warningRed, size: 16),
                  SizedBox(width: 6),
                  Text(
                    'CRITICAL ACTION',
                    style: TextStyle(
                      color: AppColors.warningRed,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Before you go,\nlet's talk about\nyour harvest.",
              style: TextStyle(
                color: AppColors.primaryGreen,
                fontSize: 42,
                fontWeight: FontWeight.w900,
                height: 1.1,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Deleting your account is permanent. All stewardship data curated over the seasons will be irrecoverably removed from the Verdant Harvest ecosystem.",
              style: TextStyle(
                color: AppColors.textBody,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            // Cards List
            const SecurityDataCard(
              icon: Icons.history_edu,
              title: "Historical Records",
              description: "Five years of planting cycles, soil amendment logs, and harvest yields will be purged. Your digital legacy as a land steward cannot be restored.",
              showWatermark: true,
              isElevated: true,
            ),
            const SizedBox(height: 16),
            const SecurityDataCard(
              icon: Icons.visibility_outlined,
              title: "Scouting Data",
              description: "Pest monitoring, moisture readings, and satellite imagery overlays will be disconnected and deleted.",
              color: AppColors.cardGrey1,
            ),
            const SizedBox(height: 16),
            const SecurityDataCard(
              icon: Icons.admin_panel_settings_outlined,
              title: "Profile Assets",
              description: "Personalized alerts, trusted collaborator permissions, and your professional farmer identity settings.",
              color: AppColors.cardGrey2,
            ),
            const SizedBox(height: 48),
            // Buttons
            SizedBox(
              width: double.infinity,
              height: 64,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Keep My Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.verified_user_outlined, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Proceed with account deletion',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class SecurityDataCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color? color;
  final bool showWatermark;
  final bool isElevated;

  const SecurityDataCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.color,
    this.showWatermark = false,
    this.isElevated = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isElevated 
          ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]
          : null,
      ),
      child: Stack(
        children: [
          if (showWatermark)
            Positioned(
              right: -10,
              bottom: -10,
              child: Icon(
                Icons.bolt,
                size: 100,
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: AppColors.primaryGreen, size: 28),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textBody,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}