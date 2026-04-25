import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF9FBFB),
      ),
      home: const StartCroppingCycleScreen(),
    );
  }
}

class StartCroppingCycleScreen extends StatelessWidget {
  const StartCroppingCycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFF0F2F2),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF2D3132), size: 20),
              onPressed: () {},
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Start Cropping Cycle',
          style: TextStyle(
            color: Color(0xFF2D3132),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // REFINED STEP INDICATOR
            const _StepIndicator(),
            const SizedBox(height: 40),
            // EXTRA BOLD HEADER
            const Text(
              'Configure Cycle',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900, // Extra Bold
                color: Color(0xFF1A1C1E),
                letterSpacing: -0.8,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Set up the details for your next planting cycle. Choose the field you\'ll use and decide when planting and harvesting will happen.',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF5E6266),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            const _TargetLocationCard(),
            const SizedBox(height: 20),
            const _CycleParametersCard(),
            const SizedBox(height: 120),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE8ECEF))),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF134E39),
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 0,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Save Cropping Cycle',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Colors.white, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Background Line
            Container(
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xFFE8ECEF),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Progress Line (leading to middle)
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFF134E39),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            // Circular Steps
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Step 1: Completed with shadow
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFF134E39),
                    child: Icon(Icons.check, color: Colors.white, size: 18),
                  ),
                ),
                // Step 2: Active with Halo/Glow
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF134E39).withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFF134E39),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(
              child: Text(
                'Farm & Field',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF134E39),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Cycle Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF134E39),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TargetLocationCard extends StatelessWidget {
  const _TargetLocationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Target Location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.location_on_outlined, color: Color(0xFF134E39)),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Select Farm', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF5E6266))),
          const SizedBox(height: 8),
          _buildDropdown('North Valley Estate'),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1500382017468-9049fed747ef?q=80&w=1000',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 80,
                  child: Transform.rotate(
                    angle: -0.4,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF134E39).withOpacity(0.4),
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('SELECTED', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.expand_more),
          items: [value].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }
}

class _CycleParametersCard extends StatelessWidget {
  const _CycleParametersCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Cycle Parameters', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildFieldLabel('Cycle Name / Identifier'),
          _buildInput('e.g. Winter Wheat \'24'),
          const SizedBox(height: 16),
          _buildFieldLabel('Crop Variety'),
          _buildDropdownInput('Select Variety'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildFieldLabel('Est. Planting'), _buildInput('mm/dd/yyyy')])),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildFieldLabel('Est. Harvest'), _buildInput('mm/dd/yyyy')])),
            ],
          ),
          const SizedBox(height: 16),
          _buildFieldLabel('Target Seed Density'),
          Row(
            children: [
              Expanded(flex: 2, child: _buildInput('1.2')),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(color: const Color(0xFFF0F2F2), borderRadius: BorderRadius.circular(26)),
                  child: const Center(child: Text('M seeds/ha', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF5E6266))),
      );

  Widget _buildInput(String hint) => TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: const Color(0xFFF0F2F2),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      );

  Widget _buildDropdownInput(String hint) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: const Color(0xFFF0F2F2), borderRadius: BorderRadius.circular(12)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(hint: Text(hint), isExpanded: true, icon: const Icon(Icons.expand_more), items: const [], onChanged: (_) {}),
        ),
      );
}