import 'package:flutter/material.dart';

// --- CONSTANTS ---
const Color kPrimaryGreen = Color(0xFF134E39);
const Color kAccentGreen = Color(0xFF27AE60);
const Color kBackground = Color(0xFFF9FBFB);
const Color kWhite = Color(0xFFFFFFFF);
const Color kTextDark = Color(0xFF1A1C1E);
const Color kTextGrey = Color(0xFF5E6266);
const Color kBorder = Color(0xFFE8ECEF);
const Color kCompletedBg = Color(0xFFE8F5E9);

class CompletedCycleScreen extends StatelessWidget {
  const CompletedCycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            // --- APP BAR ---
            _buildAppBar(),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildHeaderSection(),
                    const SizedBox(height: 24),
                    _buildHarvestSummary(),
                    const SizedBox(height: 24),
                    _buildEfficiencyScore(),
                    const SizedBox(height: 24),
                    _buildFinancialResults(),
                    const SizedBox(height: 24),
                    _buildSuccessMetrics(),
                    const SizedBox(height: 32),
                    const Text(
                      'Closing Activities',
                      style: TextStyle(
                        color: kPrimaryGreen,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTimeline(),
                    const SizedBox(height: 24),
                    _buildGeographicalArchive(),
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

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: kPrimaryGreen),
            onPressed: () {},
          ),
          const Text(
            'Cycle Details',
            style: TextStyle(
              color: kPrimaryGreen,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              IconButton(icon: const Icon(Icons.share_outlined, color: kPrimaryGreen), onPressed: () {}),
              IconButton(icon: const Icon(Icons.more_vert, color: kPrimaryGreen), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: kCompletedBg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'COMPLETED',
            style: TextStyle(color: kPrimaryGreen, fontSize: 10, fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Winter Maize 24',
          style: TextStyle(color: kPrimaryGreen, fontSize: 32, fontWeight: FontWeight.w800),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(Icons.location_on_outlined, size: 16, color: kTextGrey),
                SizedBox(width: 4),
                Text('North Sector B-12', style: TextStyle(color: kTextGrey, fontWeight: FontWeight.w600)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('ARCHIVED DATE', style: TextStyle(color: kTextGrey, fontSize: 10, fontWeight: FontWeight.w800)),
                const Text('Nov 24, 2024', style: TextStyle(color: kPrimaryGreen, fontSize: 16, fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHarvestSummary() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('HARVEST SUMMARY', style: TextStyle(color: kTextGrey, fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildStat('44.6', 'Tons', 'Final Yield'),
              const SizedBox(width: 40),
              _buildStat('1,250', 'Ha', 'Harvested Area'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String unit, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(value, style: const TextStyle(color: kPrimaryGreen, fontSize: 32, fontWeight: FontWeight.w900)),
            const SizedBox(width: 4),
            Text(unit, style: const TextStyle(color: kPrimaryGreen, fontSize: 16, fontWeight: FontWeight.w700)),
          ],
        ),
        Text(label, style: const TextStyle(color: kTextGrey, fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildEfficiencyScore() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('EFFICIENCY SCORE', style: TextStyle(color: kTextGrey, fontSize: 11, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('94%', style: TextStyle(color: kPrimaryGreen, fontSize: 36, fontWeight: FontWeight.w900)),
              const SizedBox(width: 8),
              const Icon(Icons.trending_up, color: kAccentGreen, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: 0.94,
            backgroundColor: kBorder,
            color: kAccentGreen,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialResults() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: kPrimaryGreen,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('FINANCIAL RESULTS', style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.w800)),
          const SizedBox(height: 24),
          _buildFinanceRow('Gross Income', '\₱3,450.00'),
          const SizedBox(height: 16),
          _buildFinanceRow('Pest Loss Deductions', '- ₱1,090.00'),
          const Divider(color: Colors.white24, height: 32),
          const Center(child: Text('NET INCOME', style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.w800))),
          const Center(
            child: Text(
              '\$2,360.00',
              style: TextStyle(color: kWhite, fontSize: 40, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinanceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _buildSuccessMetrics() {
    return Row(
      children: [
        Expanded(child: _buildMetricCard('PEST CONTROL SUCCESS', '88%', Icons.bug_report_outlined)),
        const SizedBox(width: 16),
        Expanded(child: _buildMetricCard('IRRIGATION ACCURACY', '97.2%', Icons.opacity)),
      ],
    );
  }

  Widget _buildMetricCard(String label, String value, IconData icon) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: kBackground,
            radius: 20,
            child: Icon(icon, color: kPrimaryGreen, size: 20),
          ),
          const SizedBox(height: 16),
          Text(label, style: const TextStyle(color: kTextGrey, fontSize: 9, fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: kPrimaryGreen, fontSize: 24, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        _buildTimelineItem('Cycle Archived', 'Oct 24, 14:30', 'Final records moved to long-term storage.', true),
        _buildTimelineItem('Record Finalized', 'Oct 22, 10:15', 'Harvest metrics validated by regional supervisor.', true),
        _buildTimelineItem('Harvest Completed', 'Oct 20, 18:45', 'All designated plots in B-12 fully cleared.', false),
      ],
    );
  }

  Widget _buildTimelineItem(String title, String date, String sub, bool showLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const Icon(Icons.check_circle, color: kPrimaryGreen, size: 24),
            if (showLine) Container(width: 2, height: 50, color: kPrimaryGreen.withOpacity(0.2)),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: const TextStyle(color: kPrimaryGreen, fontWeight: FontWeight.w800, fontSize: 15)),
                  Text(date, style: const TextStyle(color: kTextGrey, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 4),
              Text(sub, style: const TextStyle(color: kTextGrey, fontSize: 13)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGeographicalArchive() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Container(
        height: 240,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1500382017468-9049fed747ef?q=80&w=1000'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, kPrimaryGreen.withOpacity(0.8)],
            ),
          ),
          padding: const EdgeInsets.all(24),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('GEOGRAPHICAL ARCHIVE', style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.0)),
              const SizedBox(height: 4),
              const Text(
                'North Sector B-12 Plot\nTopology',
                style: TextStyle(color: kWhite, fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: kBorder.withOpacity(0.5)),
      ),
      child: child,
    );
  }
}