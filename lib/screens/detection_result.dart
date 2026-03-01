import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Corrected import

class DetectionResult extends StatelessWidget {
  final Map<String, dynamic> data;

  const DetectionResult({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    const Color bgDark = Color(0xFF102216);
    const Color errorRed = Color(0xFFE32525);
    const Color successGreen = Color(0xFF76CA22);
    const Color cardBg = Color(0xFF232C26);
    const Color greyText = Color(0xFF878787);
    const Color white = Color(0xFFFFFFFF);
    const Color primaryBtn = Color(0xFF8DBA60);

    // Using detection coordinates
    final LatLng detectionLocation = const LatLng(14.5995, 120.9842);

    return Scaffold(
      backgroundColor: bgDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Analysis Result",
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'assets/images/faw.png',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 220,
                    color: cardBg,
                    child: const Icon(Icons.bug_report, size: 80, color: greyText),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Identified Pest", style: TextStyle(color: greyText, fontSize: 14)),
                          Text(
                            data['name'] ?? "Fall Armyworm",
                            style: const TextStyle(color: white, fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Spodoptera frugiperda",
                            style: TextStyle(color: greyText, fontStyle: FontStyle.italic, fontSize: 14),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(color: bgDark, shape: BoxShape.circle),
                        child: const Icon(Icons.pest_control, color: greyText, size: 28),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: greyText, thickness: 0.5),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Life Stage", style: TextStyle(color: greyText)),
                            Text(data['stage'] ?? "Larvae (L3)", 
                                style: const TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Risk Level", style: TextStyle(color: greyText)),
                            Row(
                              children: [
                                Container(width: 10, height: 10, decoration: const BoxDecoration(color: errorRed, shape: BoxShape.circle)),
                                const SizedBox(width: 8),
                                const Text("High Risk", 
                                    style: TextStyle(color: errorRed, fontSize: 18, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Row(
                    children: [
                      Icon(Icons.grid_view_rounded, color: successGreen, size: 20),
                      SizedBox(width: 8),
                      Text("Analysis Content", style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Detected widespread leaf tissues loss (skelentinozation). The pattern suggests a transition from L2 to L3 stage. GIS data shows high humidity in Sector 4B, increasing spread risk.",
                    style: TextStyle(color: greyText, fontSize: 14, height: 1.4),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.map_outlined, color: white),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("GIS Location", style: TextStyle(color: greyText, fontSize: 12)),
                              Text(data['field'] ?? "Sector 4B - field #12", 
                                  style: const TextStyle(color: white, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("View Map", style: TextStyle(color: greyText)),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: detectionLocation,
                          initialZoom: 13.0,
                          interactionOptions: const InteractionOptions(flags: InteractiveFlag.none),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: detectionLocation,
                                width: 40,
                                height: 40,
                                child: const Icon(Icons.location_on, color: errorRed, size: 40),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBtn,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Proceed Risk Mapping",
                    style: TextStyle(color: bgDark, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgDark,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: successGreen,
        unselectedItemColor: greyText,
        currentIndex: 3, 
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.sync), label: 'Cycle'),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart), label: 'Mitigation'),
        ],
      ),
    );
  }
}