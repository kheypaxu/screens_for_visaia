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

class CroppingCyclesScreen extends StatefulWidget {
  const CroppingCyclesScreen({super.key});

  @override
  State<CroppingCyclesScreen> createState() => _CroppingCyclesScreenState();
}

class _CroppingCyclesScreenState extends State<CroppingCyclesScreen> {
  // Logic to freeze the background scroll
  bool _isOverlayActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                // This prevents the background from moving when the dialog is up
                physics: _isOverlayActive 
                    ? const NeverScrollableScrollPhysics() 
                    : const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      'Cropping Cycles',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF134E39),
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSearchBar(),
                    const SizedBox(height: 24),
                    _buildFilterRow(),
                    const SizedBox(height: 24),
                    CropCycleCard(
                      title: 'Soybean Summer',
                      subtitle: 'Field Block 4B • 120 Acres',
                      progress: 0.65,
                      harvestDate: 'Oct 12',
                      statusText: 'High Moisture Risk',
                      statusColor: const Color(0xFFC0392B),
                      statusIcon: Icons.warning_rounded,
                      progressColor: const Color(0xFF134E39),
                      icon: Icons.grass,
                      iconColor: const Color(0xFF134E39),
                      onMenuTap: () => _showScreen2BottomSheet(context, 'Soybean Summer'),
                    ),
                    const SizedBox(height: 16),
                    CropCycleCard(
                      title: 'Soybean Delta',
                      subtitle: 'River Tract 2 • 85 Acres',
                      progress: 0.30,
                      harvestDate: 'Nov 05',
                      statusText: 'Optimal Conditions',
                      statusColor: const Color(0xFF27AE60),
                      statusIcon: Icons.check_circle,
                      progressColor: const Color(0xFF134E39),
                      icon: Icons.spa,
                      iconColor: const Color(0xFF134E39),
                      onMenuTap: () => _showScreen2BottomSheet(context, 'Soybean Delta'),
                    ),
                    const SizedBox(height: 16),
                    CropCycleCard(
                      title: 'Corn Hybrid X',
                      subtitle: 'North Ridge • 210 Acres',
                      progress: 0.85,
                      harvestDate: 'Sep 28',
                      statusText: 'Pest Alert Nearby',
                      statusColor: const Color(0xFFEEB20C),
                      statusIcon: Icons.warning_amber_rounded,
                      progressColor: const Color(0xFFEEB20C),
                      icon: Icons.eco,
                      iconColor: const Color.fromARGB(255, 163, 112, 1),
                      onMenuTap: () => _showScreen2BottomSheet(context, 'Corn Hybrid X'),
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
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Row(
        children: [
          Icon(Icons.search, color: Color(0xFF5E6266), size: 24),
          SizedBox(width: 12),
          Text('Search fields or crops...', style: TextStyle(color: Color(0xFFA1A5A8), fontSize: 16)),
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
            decoration: BoxDecoration(color: const Color(0xFFF0F2F2), borderRadius: BorderRadius.circular(24)),
            child: Row(
              children: [
                const Expanded(child: Center(child: Text('Active', style: TextStyle(color: Color(0xFF5E6266), fontWeight: FontWeight.w600)))),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: const Text('Completed', style: TextStyle(color: Color(0xFF134E39), fontWeight: FontWeight.w700)),
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
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: const Color(0xFFE8ECEF))),
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
        _actionItem(icon: Icons.eco, title: 'Start New Cycle', subtitle: 'Monitor new cropping cycle', isPrimary: true),
        const SizedBox(height: 16),
        _actionItem(icon: Icons.shopping_basket_outlined, title: 'Record Previous Cycle', subtitle: 'Record yield and losses', isPrimary: false),
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
            decoration: BoxDecoration(color: isPrimary ? Colors.white.withOpacity(0.15) : const Color(0xFFF0F2F2), shape: BoxShape.circle),
            child: Icon(icon, color: isPrimary ? Colors.white : const Color(0xFF134E39)),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: isPrimary ? Colors.white : const Color(0xFF134E39), fontSize: 18, fontWeight: FontWeight.w900)),
              Text(subtitle, style: TextStyle(color: isPrimary ? Colors.white.withOpacity(0.7) : const Color(0xFF5E6266), fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  void _showScreen2BottomSheet(BuildContext context, String cropName) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withOpacity(0.4),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 40, height: 4, decoration: BoxDecoration(color: const Color(0xFFE8ECEF), borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 24),
              _sheetTile(Icons.edit_outlined, 'Edit Cycle', const Color(0xFF134E39), () {}),
              _sheetTile(Icons.share_outlined, 'Share Data', const Color(0xFF134E39), () {}),
              const Divider(height: 32, color: Color(0xFFF0F2F2)),
              _sheetTile(Icons.delete_outline_rounded, 'Delete Cycle', const Color(0xFFC0392B), () {
                Navigator.pop(context); 
                _showScreen3DeleteOverlay(context, cropName); 
              }),
              const SizedBox(height: 20),
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel', style: TextStyle(color: Color(0xFF5E6266), fontWeight: FontWeight.w600, fontSize: 16))),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  Widget _sheetTile(IconData icon, String label, Color color, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 16)),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }

  void _showScreen3DeleteOverlay(BuildContext context, String cropName) {
    setState(() => _isOverlayActive = true); // Lock the background scroll

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.6),
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(color: Color(0xFFFFE5E5), shape: BoxShape.circle),
                  child: const Icon(Icons.delete_outline_rounded, color: Color(0xFFC0392B), size: 40),
                ),
                const SizedBox(height: 24),
                const Text('Delete Cropping Cycle?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF1A1C1E))),
                const SizedBox(height: 16),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(fontSize: 15, color: Color(0xFF5E6266), height: 1.5, fontFamily: 'Inter'),
                    children: [
                      const TextSpan(text: 'Are you sure you want to delete\n'),
                      TextSpan(
                        text: cropName,
                        style: const TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF1A1C1E)),
                      ),
                      const TextSpan(text: '? This action cannot be undone and all records will be removed.'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFC0392B), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)), elevation: 0),
                    onPressed: () {
                      setState(() => _isOverlayActive = false);
                      Navigator.pop(context);
                    },
                    child: const Text('Delete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: const Color(0xFFF0F2F2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
                    onPressed: () {
                      setState(() => _isOverlayActive = false);
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel', style: TextStyle(color: Color(0xFF1A1C1E), fontWeight: FontWeight.w800)),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      // Ensure scroll is unlocked even if dialog is dismissed via other means
      if (mounted) setState(() => _isOverlayActive = false);
    });
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
  final Color iconColor;
  final VoidCallback onMenuTap;

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
    required this.iconColor,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 6))],
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
                    CircleAvatar(radius: 26, backgroundColor: const Color(0xFFF0F2F2), child: Icon(icon, color: iconColor, size: 28)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: Color(0xFF1A1C1E))),
                          Text(subtitle, style: const TextStyle(fontSize: 14, color: Color(0xFF5E6266), fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    IconButton(icon: const Icon(Icons.more_vert, color: Color(0xFF1A1C1E)), onPressed: onMenuTap),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('PROGRESS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: Color(0xFF5E6266), letterSpacing: 1.0)),
                    Text('${(progress * 100).toInt()}%', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: progressColor)),
                  ],
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Container(height: 8, decoration: BoxDecoration(color: const Color(0xFFE8ECEF), borderRadius: BorderRadius.circular(4))),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(height: 8, decoration: BoxDecoration(color: progressColor, borderRadius: BorderRadius.circular(4))),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text('Est. Harvest: $harvestDate', style: const TextStyle(fontSize: 13, color: Color(0xFF5E6266), fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(color: Color(0xFFF4F6F6), borderRadius: BorderRadius.vertical(bottom: Radius.circular(28))),
            child: Row(
              children: [
                Icon(statusIcon, size: 18, color: statusColor),
                const SizedBox(width: 10),
                Expanded(child: Text(statusText, style: TextStyle(fontSize: 14, color: statusColor, fontWeight: FontWeight.w700))),
                const Icon(Icons.arrow_forward, size: 18, color: Color(0xFF5E6266)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}