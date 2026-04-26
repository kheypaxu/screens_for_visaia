import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ==========================================
// PIXEL-PERFECT BRAND COLORS
// ==========================================
const Color kPrimaryGreen = Color(0xFF004D40);
const Color kActionGreen = Color(0xFF1B5E20);
const Color kLightGreenBg = Color(0xFFF1F8F1);
const Color kTextDark = Color(0xFF1A1A1A);
const Color kTextGrey = Color(0xFF666666);
const Color kAccentRed = Color(0xFFB71C1C);
const Color kBorderColor = Color(0xFFE0E0E0);
const Color kSoftGreenLabel = Color(0xFFC8E6C9);

class FirstMonitoringScreen extends StatefulWidget {
  const FirstMonitoringScreen({super.key});

  @override
  State<FirstMonitoringScreen> createState() => _FirstMonitoringScreenState();
}

class _FirstMonitoringScreenState extends State<FirstMonitoringScreen> {
  bool _showControlModal = false;
  bool _showSummaryModal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFDFA),
      // bottomNavigationBar removed as requested
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              physics: (_showControlModal || _showSummaryModal)
                  ? const NeverScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 16),
                  _buildControlMethodsCard(),
                  const SizedBox(height: 24),
                  _buildActivityTabs(),
                  _buildWeekSelector(),
                  _buildScoutingProgress(),
                  _buildInspectionPoints(),
                  _buildTotalFindings(),
                  const SizedBox(height: 32),
                  _buildSaveButton(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Modals
          if (_showControlModal) _buildControlMethodModal(),
          if (_showSummaryModal) _buildSummaryReportModal(),
        ],
      ),
    );
  }

  // ========================
  // HEADER
  // ========================
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back, color: kTextDark),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Monitoring',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: kActionGreen,
                  ),
                ),
                Text(
                  'Soybean Summer • Field A',
                  style: GoogleFonts.inter(fontSize: 12, color: kTextGrey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24), 
        ],
      ),
    );
  }

  // ========================
  // CONTROL METHODS CARD
  // ========================
  Widget _buildControlMethodsCard() {
    return GestureDetector(
      onTap: () => setState(() => _showControlModal = true),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kBorderColor.withValues(alpha: 0.8)),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)],
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 40,
              decoration: const BoxDecoration(
                color: kActionGreen,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.bug_report, color: kActionGreen, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Control Methods',
                      style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14)),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(fontSize: 11, color: kTextGrey),
                      children: const [
                        TextSpan(text: 'Track potential outbreaks. '),
                        TextSpan(
                          text: 'Know more?',
                          style: TextStyle(color: Color.fromARGB(255, 120, 168, 64), decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_circle_right_outlined, color: kTextGrey, size: 22),
          ],
        ),
      ),
    );
  }

  // ========================
  // TABS & WEEK SELECTOR
  // ========================
  Widget _buildActivityTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Expanded(child: Center(child: Text('Daily Activity Log', style: GoogleFonts.inter(fontSize: 14, color: kTextGrey)))),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25), boxShadow: [BoxShadow(color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.05), blurRadius: 4)]),
              child: Center(child: Text('Weekly Tasks', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 0, 99, 23)))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('No. of Weeks', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16)),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: List.generate(6, (index) {
              bool isSelected = index == 0;
              return Container(
                margin: const EdgeInsets.only(right: 12),
                width: 56, height: 56,
                decoration: BoxDecoration(color: isSelected ? kActionGreen : const Color(0xFFF5F5F5), shape: BoxShape.circle),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Week', style: GoogleFonts.inter(fontSize: 9, color: isSelected ? Colors.white70 : kTextGrey)),
                    Text('${index + 1}', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: isSelected ? Colors.white : kTextDark)),
                  ],
                ),
              );
            }),
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(left: 20, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Field Scouting', style: TextStyle(color: kActionGreen, fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 4),
              Container(width: 90, height: 2, color: kActionGreen),
            ],
          ),
        )
      ],
    );
  }

  // ========================
  // PROGRESS & INSPECTION
  // ========================
  Widget _buildScoutingProgress() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF4F4F4), borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Scouting Progress', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15)),
              Text('2 of 5 stations completed', style: GoogleFonts.inter(fontSize: 11, color: kActionGreen, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(value: 0.4, backgroundColor: Color(0xFFE0E0E0), valueColor: AlwaysStoppedAnimation<Color>(kActionGreen), minHeight: 6),
          ),
        ],
      ),
    );
  }

  Widget _buildInspectionPoints() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Inspection Points', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 18)),
          RichText(
            text: TextSpan(
              style: GoogleFonts.inter(fontSize: 12, color: kTextGrey),
              children: const [
                TextSpan(text: 'Inspect 10 plants per point and record FAW signs\n'),
                TextSpan(text: 'More info about field scouting? ', style: TextStyle(color: Color.fromARGB(255, 76, 114, 33))),
                TextSpan(
                  text: 'Click here.',
                  style: TextStyle(color: Color.fromARGB(255, 76, 114, 33), decoration: TextDecoration.underline, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildStationTile('Station 1', true, "1"),
          _buildStationTile('Station 2', true, "2"),
          _buildStation3Expanded(),
          _buildStationTile('Station 4', false, "4"),
          _buildStationTile('Station 5', false, "5"),
        ],
      ),
    );
  }

  Widget _buildStationTile(String title, bool completed, String index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: kBorderColor.withValues(alpha: 0.6))),
      child: Row(
        children: [
          CircleAvatar(
            radius: 14, 
            backgroundColor: completed ? const Color.fromARGB(255, 155, 228, 61) : const Color(0xFFE0E0E0), 
            child: completed 
              ? const Icon(Icons.check, size: 14, color: Color.fromARGB(255, 23, 94, 27)) 
              : Text(index, style: const TextStyle(fontSize: 12, color: kTextGrey, fontWeight: FontWeight.bold))
          ),
          const SizedBox(width: 12),
          Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
          const Spacer(),
          if (completed)
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(12)), child: Text('COMPLETED', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 49, 114, 51))))
          else
            const Icon(Icons.keyboard_arrow_down, color: kTextGrey),
        ],
      ),
    );
  }

  Widget _buildStation3Expanded() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: kActionGreen, width: 2), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 14, backgroundColor: Color(0xFF004D40), child: Text('3', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
              const SizedBox(width: 12),
              Text('Station 3', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15)),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_up),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildInputBox('PLANTS INSPECTED', '10', false)),
              const SizedBox(width: 12),
              Expanded(child: _buildInputBox('DAMAGED', '2', true)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFFFEBEE), borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(color: kAccentRed, shape: BoxShape.circle),
                child: const Icon(Icons.check, color: Colors.white, size: 10),
              ), 
              const SizedBox(width: 8), 
              Text('FAW damage observed', style: GoogleFonts.inter(color: kAccentRed, fontWeight: FontWeight.w600, fontSize: 13))
            ]),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSmallCounter('EGG MASSES', '1', kTextDark), 
              _buildSmallCounter('LARVAE', '3', kAccentRed), 
              _buildSmallCounter('PUPAE', '0', kTextDark)
            ],
          ),
          const SizedBox(height: 16),
          _buildNotesBox(),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.photo_camera_outlined, size: 18),
            label: const Text('Upload Photo'),
            style: OutlinedButton.styleFrom(foregroundColor: kTextDark, minimumSize: const Size(double.infinity, 50), side: const BorderSide(color: kBorderColor), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
          )
        ],
      ),
    );
  }

  // ========================
  // TOTAL FINDINGS
  // ========================
  Widget _buildTotalFindings() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28), border: Border.all(color: kBorderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Findings', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 17)),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildFindingTile('DAMAGED', '5', kTextDark)),
              const SizedBox(width: 12),
              Expanded(child: _buildFindingTile('EGGS', '2', kTextDark)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildFindingTile('LARVAE', '8', kAccentRed)),
              const SizedBox(width: 12),
              Expanded(child: _buildFindingTile('PUPAE', '1', kTextDark)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () => setState(() => _showSummaryModal = true),
        style: ElevatedButton.styleFrom(backgroundColor: kActionGreen, minimumSize: const Size(double.infinity, 56), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        child: Text('Save Weekly Report', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }

  // ========================
  // REUSABLE COMPONENTS
  // ========================
  Widget _buildInputBox(String label, String val, bool counter) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 9, color: kTextGrey, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [if (counter) const Icon(Icons.remove, size: 14), Text(val, style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16, color: kTextDark)), if (counter) const Icon(Icons.add, size: 14)]),
        ],
      ),
    );
  }

  Widget _buildSmallCounter(String label, String val, Color valueColor) {
    return Container(
      width: 90, padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(25)),
      child: Column(children: [Text(label, style: GoogleFonts.inter(fontSize: 8, color: kTextGrey, fontWeight: FontWeight.bold)), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Icon(Icons.remove, size: 12), Text(val, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: valueColor)), const Icon(Icons.add, size: 12)])]),
    );
  }

  Widget _buildNotesBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('NOTES', style: GoogleFonts.inter(fontSize: 9, color: kTextGrey, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('Small larvae found on upper leaves', style: GoogleFonts.inter(fontSize: 13, color: kTextDark)),
        ],
      ),
    );
  }

  Widget _buildFindingTile(String label, String count, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: kBorderColor.withValues(alpha: 0.5))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: GoogleFonts.inter(fontSize: 9, color: kTextGrey, fontWeight: FontWeight.bold)), Text(count, style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: color))]),
    );
  }

  // ========================
  // MODALS
  // ========================
  Widget _buildControlMethodModal() {
    return Container(
      color: Colors.black.withValues(alpha: 0.5),
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(color: const Color(0xFFF4F7F4), borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Choose Your Control Method', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text('Explore detailed steps for each management strategy based on environmental impact.', style: GoogleFonts.inter(fontSize: 14, color: kTextGrey)),
            const SizedBox(height: 24),
            _modalOption(Icons.bug_report, 'Biological Control', 'Utilize natural predators and parasitoids to manage pests with zero chemical footprint.', true),
            const SizedBox(height: 16),
            _modalOption(Icons.science_outlined, 'Chemical Control', 'Targeted synthetic applications. Recommended only as a last resort for acute infestations.', false),
            const SizedBox(height: 32),
            Center(child: InkWell(onTap: () => setState(() => _showControlModal = false), child: const Text('Continue with physical control? Back to monitoring', textAlign: TextAlign.center, style: TextStyle(decoration: TextDecoration.underline, color: kTextGrey, fontSize: 13)))),
          ],
        ),
      ),
    );
  }

  Widget _modalOption(IconData icon, String title, String desc, bool rec) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            CircleAvatar(backgroundColor: kLightGreenBg, radius: 18, child: Icon(icon, color: kActionGreen, size: 20)),
            const SizedBox(width: 12),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Spacer(),
            if (rec) Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: kActionGreen, borderRadius: BorderRadius.circular(8)), child: const Text('RECOMMENDED', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)))
          ]),
          const SizedBox(height: 8),
          Text(desc, style: GoogleFonts.inter(fontSize: 12, color: kTextGrey)),
        ],
      ),
    );
  }

  Widget _buildSummaryReportModal() {
    return Container(
      color: Colors.black.withValues(alpha: 0.5),
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(color: const Color(0xFFF9FBF9), borderRadius: BorderRadius.circular(32)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: kSoftGreenLabel, borderRadius: BorderRadius.circular(20)), child: const Text('REPORT FINALIZED', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: kActionGreen))),
                  const SizedBox(height: 12),
                  Text('Scouting Saved', style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold, color: kActionGreen)),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Week 1 • Soybean Summer', style: GoogleFonts.inter(fontSize: 14, color: const Color.fromARGB(255, 56, 56, 56))),
                    Text('Today, 10:24 AM', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: kActionGreen)),
                  ]),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20)]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [const Icon(Icons.lightbulb_outline, color: kActionGreen), const SizedBox(width: 8), Text('VISAIA Recommendation', style: TextStyle(fontWeight: FontWeight.bold, color: kActionGreen))]),
                        const SizedBox(height: 12),
                        RichText(text: const TextSpan(style: TextStyle(color: kTextDark, fontSize: 14), children: [
                          TextSpan(text: 'Based on your Week 1 report, '),
                          TextSpan(text: 'Biological Control', style: TextStyle(fontWeight: FontWeight.bold,)),
                          TextSpan(text: ' is the recommended method for FAW infestation.'),
                        ])),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE9F0ED),
                            border: Border(left: BorderSide(color: Color.fromARGB(255, 35, 153, 133), width: 4)),
                          ),
                          child: Text(
                            'Note: Predator population is currently at 12%—introducing target beneficials now will maximize yield preservation.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                              height: 1.4,
                              color: kTextDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextButton(onPressed: () => setState(() => _showSummaryModal = false), child: const Text('Back to Monitoring', style: TextStyle(color: kActionGreen))),
          ],
        ),
      ),
    );
  }
}