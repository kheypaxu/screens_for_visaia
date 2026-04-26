import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

// ==========================================
// CENTRALIZED DESIGN SYSTEM
// ==========================================
class AppColors {
  static const Color primaryGreen = Color(0xFF004D40);
  static const Color actionGreen = Color(0xFF1B5E20);
  static const Color background = Color(0xFFFBFDFA);
  static const Color surface = Colors.white;
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF666666);
  static const Color border = Color(0xFFE0E0E0);
  static const Color tabBg = Color(0xFFF2F2F2);
  static const Color noteBg = Color(0xFFE9F0ED);
}

class DailyActivity extends StatefulWidget {
  const DailyActivity({super.key});

  @override
  State<DailyActivity> createState() => _DailyActivityState();
}

class _DailyActivityState extends State<DailyActivity> {
  // 0: Daily Activity Log (Image 4), 1: Weekly Task (Images 1, 2, 3)
  int _selectedTabIndex = 0; 
  bool _isControlModalVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                _buildViewTrapsCard(), // High-level trap status
                const SizedBox(height: 16),
                _buildActivityTabs(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: _selectedTabIndex == 0 
                        ? const DailyActivityLogView() 
                        : const WeeklyTaskView(),
                  ),
                ),
              ],
            ),
          ),

          // Control Method Modal Overlay
          if (_isControlModalVisible) ...[
            Positioned.fill(
              child: GestureDetector(
                onTap: () => setState(() => _isControlModalVisible = false),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(color: Colors.black.withOpacity(0.3)),
                ),
              ),
            ),
            Center(child: _buildControlModal()),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Row(
        children: [
          const Icon(Icons.arrow_back, color: AppColors.textDark),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Monitoring', 
                style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textDark)),
              Text('Soybean Summer • Plot 4B', 
                style: GoogleFonts.inter(fontSize: 12, color: AppColors.textGrey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildViewTrapsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: const Border(left: BorderSide(color: AppColors.primaryGreen, width: 4)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFF1F8F1),
            child: Icon(Icons.bug_report_outlined, color: AppColors.actionGreen),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('View Traps', style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14)),
                Text('Active monitoring on', style: GoogleFonts.inter(fontSize: 12, color: AppColors.textGrey)),
              ],
            ),
          ),
          IconButton(
            onPressed: () => setState(() => _isControlModalVisible = true),
            icon: const Icon(Icons.arrow_circle_right_outlined, color: AppColors.textGrey),
          )
        ],
      ),
    );
  }

  Widget _buildActivityTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: AppColors.tabBg, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          _tabItem("Daily Activity Log", 0),
          _tabItem("Weekly Task", 1),
        ],
      ),
    );
  }

  Widget _tabItem(String label, int index) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            boxShadow: isSelected ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)] : [],
          ),
          child: Center(
            child: Text(label, 
              style: GoogleFonts.inter(
                fontSize: 13, 
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? AppColors.actionGreen : AppColors.textGrey
              )),
          ),
        ),
      ),
    );
  }

  Widget _buildControlModal() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFFF1F5F2), borderRadius: BorderRadius.circular(28)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose Your Control Method', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text('Explore detailed steps for each management strategy...',
              style: GoogleFonts.inter(fontSize: 13, color: AppColors.textGrey)),
          const SizedBox(height: 24),
          _modalCard("Biological Control", "Utilize natural predators...", true),
          const SizedBox(height: 12),
          _modalCard("Chemical Control", "Targeted synthetic applications...", false),
          const SizedBox(height: 20),
          Center(
            child: Text('Back to monitoring',
                style: GoogleFonts.inter(fontSize: 12, decoration: TextDecoration.underline, color: AppColors.textGrey)),
          )
        ],
      ),
    );
  }

  Widget _modalCard(String title, String desc, bool isRecommended) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: isRecommended ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE), radius: 18),
              const SizedBox(width: 12),
              Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
              if (isRecommended) ...[
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.actionGreen, borderRadius: BorderRadius.circular(12)),
                  child: Text('RECOMMENDED', style: GoogleFonts.inter(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                )
              ]
            ],
          ),
          const SizedBox(height: 8),
          Text(desc, style: GoogleFonts.inter(fontSize: 11, color: AppColors.textGrey)),
        ],
      ),
    );
  }
}

// ==========================================
// CHILD VIEW: DAILY ACTIVITY LOG (Image 4/12)
// ==========================================
class DailyActivityLogView extends StatelessWidget {
  const DailyActivityLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text('Oct 2023', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildCalendarStrip(), // Matches Image 4/11 selection on Oct 25
          const SizedBox(height: 24),
          Text("Active Task", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
          _taskItem("Observe leaf damage", "Scan for FAW feeding patterns", false),
          _taskItem("Check soil moisture", "Observe soil status", false),
          const SizedBox(height: 24),
          Text("Completed Task", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
          _taskItem("Check plant condition", "Visual inspection...", true),
          _taskItem("Water crop", "Automatic cycle scheduled", true),
          const SizedBox(height: 24),
          _addActivityButton(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildCalendarStrip() {
    final days = [
      {'d': 'Mon', 'n': '23'}, {'d': 'Tue', 'n': '24'},
      {'d': 'Wed', 'n': '25'}, {'d': 'Thu', 'n': '26'},
      {'d': 'Fri', 'n': '27'}, {'d': 'Sat', 'n': '28'},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((day) {
        bool isSelected = day['n'] == '25';
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.actionGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Text(day['d']!, style: GoogleFonts.inter(fontSize: 10, color: isSelected ? Colors.white70 : AppColors.textGrey)),
              const SizedBox(height: 4),
              Text(day['n']!, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: isSelected ? Colors.white : AppColors.textDark)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _taskItem(String title, String sub, bool isDone) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.border)),
      child: Row(
        children: [
          Icon(isDone ? Icons.check_circle : Icons.radio_button_unchecked, color: isDone ? AppColors.actionGreen : AppColors.textGrey),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w600, decoration: isDone ? TextDecoration.lineThrough : null)),
              Text(sub, style: GoogleFonts.inter(fontSize: 11, color: AppColors.textGrey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _addActivityButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: AppColors.border)),
      child: Center(child: Text('+ Add Activity', style: GoogleFonts.inter(fontWeight: FontWeight.w600))),
    );
  }
}

// ==========================================
// CHILD VIEW: WEEKLY TASK (Images 1, 2, 3, 5, 6)
// ==========================================
class WeeklyTaskView extends StatelessWidget {
  const WeeklyTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _inspectionSection(), // Inspection points
        const SizedBox(height: 24),
        _recommendationSection(), // VISAIA Note
        const SizedBox(height: 32),
        _saveButton(),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _inspectionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Inspection Points', style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold)),
          Text('Inspect 10 plants per point...', style: GoogleFonts.inter(color: AppColors.textGrey, fontSize: 13)),
          const SizedBox(height: 16),
          _stationRow("Station 1", true),
          _stationRow("Station 2", true),
          _stationRow("Station 3", false, isCurrent: true),
          _stationRow("Station 4", false),
          _stationRow("Station 5", false),
        ],
      ),
    );
  }

  Widget _stationRow(String name, bool completed, {bool isCurrent = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(100), border: Border.all(color: AppColors.border.withOpacity(0.5))),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: completed ? const Color(0xFFB9F6CA) : (isCurrent ? AppColors.primaryGreen : const Color(0xFFF5F5F5)),
            radius: 14,
            child: completed ? const Icon(Icons.check, size: 14, color: AppColors.actionGreen) : Text(name.split(" ").last, style: const TextStyle(fontSize: 12)),
          ),
          const SizedBox(width: 12),
          Text(name, style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
          const Spacer(),
          if (completed) 
            Text('COMPLETED', style: GoogleFonts.inter(color: AppColors.actionGreen, fontSize: 10, fontWeight: FontWeight.bold))
          else 
            const Icon(Icons.keyboard_arrow_down, color: AppColors.textGrey)
        ],
      ),
    );
  }

  Widget _recommendationSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15)]),
      child: Column(
        children: [
          Row(children: [const Icon(Icons.lightbulb_outline, color: AppColors.actionGreen), const SizedBox(width: 8), Text('VISAIA Recommendation', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: AppColors.actionGreen))]),
          const SizedBox(height: 12),
          Text('Based on your Week 1 report, Biological Control is recommended...', style: GoogleFonts.inter(fontSize: 14)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(color: AppColors.noteBg, border: Border(left: BorderSide(color: AppColors.primaryGreen, width: 4))),
            child: Text('Note: Predator population is currently at 12%...', style: GoogleFonts.inter(fontSize: 13, fontStyle: FontStyle.italic)),
          ),
        ],
      ),
    );
  }

  Widget _saveButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        child: Text('Save Weekly Report', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}