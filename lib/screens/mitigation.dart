import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    home: MitigationProtocolScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class MitigationProtocolScreen extends StatefulWidget {
  const MitigationProtocolScreen({super.key});

  @override
  State<MitigationProtocolScreen> createState() => _MitigationProtocolScreenState();
}

class _MitigationProtocolScreenState extends State<MitigationProtocolScreen> {
  // 0 for Biological Agents, 1 for Pheromone Traps
  int _activeTab = 0;

  // Exact colors from your selection
  static const Color backgroundDark = Color(0xFF102216);
  static const Color toggleTrough = Color(0xFF1C3424);
  static const Color primaryGreen = Color(0xFF7BC72E);
  static const Color surfaceColor = Color(0xFF1E261F);
  static const Color textGrey = Color(0xFF737673);
  static const Color boxGreenBg = Color(0xFF232D18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.chevron_left, color: Colors.white),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mitigation Protocol",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "FALL ARMYWORM (SPODOPTERA FRUGIPERDA)",
              style: TextStyle(color: primaryGreen, fontSize: 10, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 12),
            child: Text.rich(
              textAlign: TextAlign.right,
              TextSpan(
                text: "LAST UPDATED\n",
                style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 9),
                children: const [
                  TextSpan(
                    text: "Today, 08:42 AM",
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // --- IMPROVED FUNCTIONAL TOGGLE SECTION ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Center(
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    color: toggleTrough,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      // Animated Selection Pill
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        alignment: _activeTab == 0 ? Alignment.centerLeft : Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Container(
                            width: 180,
                            height: 33,
                            decoration: BoxDecoration(
                              color: primaryGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      // Clickable Labels
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _activeTab = 0),
                              child: Center(
                                child: Text(
                                  "Biological Agents",
                                  style: TextStyle(
                                    color: _activeTab == 0 ? Colors.black : textGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _activeTab = 1),
                              child: Center(
                                child: Text(
                                  "Pheromone Traps",
                                  style: TextStyle(
                                    color: _activeTab == 1 ? Colors.black : textGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // CONDITIONAL CONTENT SWITCHING
            _activeTab == 0 ? _buildBiologicalTab() : _buildPheromoneTab(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- TAB 1: BIOLOGICAL AGENTS ---
  Widget _buildBiologicalTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Center(
            child: Container(
              width: 500,
              height: 160,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF364627),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text("RECOMMENDED SOLUTION",
                              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Spinetoram",
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: primaryGreen,
                          ),
                        ),
                        const Text("Target: Late-stage larvae & egg masses",
                            style: TextStyle(color: textGrey, fontSize: 14, fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 70,
                      height: 90,
                      color: const Color(0xFFA2A6A3).withOpacity(0.2),
                      child: const Icon(Icons.science, color: Colors.white38),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("DOSAGE & PREPARATION",
                  style: TextStyle(color: textGrey, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.2)),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildDosageBox("10ml", "PER 16L WATER", primaryGreen, boxGreenBg),
                  const SizedBox(width: 12),
                  _buildDosageBox("2.5L", "TOTAL/HECTARE", Colors.white, surfaceColor),
                ],
              ),
              const SizedBox(height: 12),
              _buildInstructionCard(Icons.biotech, "Mixing Instructions", "Agitate for 2 minutes. Use pH 6-7 water for maximum efficacy."),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildStepHeader("STEP-BY-STEP APPLICATION"),
        const SizedBox(height: 16),
        _buildStepList([
          _buildStep(1, "Focus on the Whorl", const Text("Pest aggregate in the central corn whorl. Direct spray downward to ensure deep penetration.", style: TextStyle(color: textGrey, fontSize: 12)), Icons.gps_fixed),
          _buildStep(2, "Optimal Timing", Text.rich(TextSpan(style: const TextStyle(color: textGrey, fontSize: 12), children: const [
            TextSpan(text: "Best applied "),
            TextSpan(text: "6:00 - 9:00 AM", style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
            TextSpan(text: " or "),
            TextSpan(text: "4:00 - 6:00 PM", style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
            TextSpan(text: ". Avoid peak heat for stability."),
          ])), Icons.access_time),
          _buildStep(3, "PPE Compliance", const Text("Full protection mandatory. Wear mask, gloves, and boots to prevent dermal exposure.", style: TextStyle(color: textGrey, fontSize: 12)), Icons.shield_outlined),
        ]),
        _buildConfirmButton("Confirm Application"),
      ],
    );
  }

  // --- TAB 2: PHEROMONE TRAPS ---
  Widget _buildPheromoneTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              children: [
                const Text("RECOMMENDED DENSITY", style: TextStyle(color: textGrey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                const SizedBox(height: 8),
                Text("4 - 5 Traps", style: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.w900, color: primaryGreen)),
                const Text("PER HECTARE (10,000 m²)", style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("TRAP SPECIFICATIONS", style: TextStyle(color: textGrey, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.2)),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildDosageBox("1.5m", "POLE HEIGHT", primaryGreen, boxGreenBg),
                  const SizedBox(width: 12),
                  _buildDosageBox("30 Days", "LURE LIFESPAN", Colors.white, surfaceColor),
                ],
              ),
              const SizedBox(height: 12),
              _buildInstructionCard(Icons.explore_outlined, "Deployment Strategy", "Place traps at the windward side of the field to maximize pheromone plume coverage."),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildStepHeader("IMPLEMENTATION SEQUENCE"),
        const SizedBox(height: 16),
        _buildStepList([
          _buildStep(1, "Lure Activation", const Text("Remove lure from sealed pouch and place inside the trap dispenser. Do not touch with bare hands.", style: TextStyle(color: textGrey, fontSize: 12)), Icons.science_outlined),
          _buildStep(2, "Spatial Distribution", const Text("Install in a zigzag pattern across the field, at least 20m apart from each other.", style: TextStyle(color: textGrey, fontSize: 12)), Icons.grid_view_rounded),
          _buildStep(3, "Data Logging", const Text("Record the GPS location of each trap. Check and count captured moths every 48-72 hours.", style: TextStyle(color: textGrey, fontSize: 12)), Icons.edit_location_alt_outlined),
        ]),
        _buildConfirmButton("Confirm Installation"),
      ],
    );
  }

  // --- REUSABLE COMPONENT METHODS ---

  Widget _buildDosageBox(String value, String unit, Color color, Color bg) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          children: [
            Text(value, style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w900, color: color)),
            Text(unit, style: const TextStyle(color: textGrey, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionCard(IconData icon, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            width: 56, height: 56,
            decoration: BoxDecoration(color: const Color(0xFF141C15), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: textGrey, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
                Text(desc, style: const TextStyle(color: textGrey, fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStepHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        children: [
          Container(width: 2, height: 16, color: primaryGreen),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildStepList(List<Widget> steps) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Stack(
        children: [
          Positioned(
            left: 14, top: 20, bottom: 70,
            child: Container(width: 2, color: primaryGreen),
          ),
          Column(children: steps),
        ],
      ),
    );
  }

  Widget _buildStep(int number, String title, Widget descWidget, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30, height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle, color: primaryGreen,
              boxShadow: [BoxShadow(color: primaryGreen.withOpacity(0.4), blurRadius: 10)],
            ),
            child: Center(child: Text("$number", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: surfaceColor, borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: primaryGreen, size: 18),
                      const SizedBox(width: 8),
                      Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  descWidget,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmButton(String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 24, 17, 0),
      child: SizedBox(
        width: double.infinity, height: 55,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryGreen, foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () {},
          icon: const Icon(Icons.check_circle),
          label: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ),
    );
  }
}