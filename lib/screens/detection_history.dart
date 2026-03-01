import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'detection_result.dart'; // Ensure this import matches your file structure

class DetectionHistory extends StatefulWidget {
  const DetectionHistory({super.key});

  @override
  State<DetectionHistory> createState() => _DetectionHistoryState();
}

class _DetectionHistoryState extends State<DetectionHistory> {
  final TextEditingController _searchController = TextEditingController();
  DateTime? _selectedDate;

  final List<Map<String, dynamic>> _allDetections = [
    {
      "name": "Fall Armyworm",
      "stage": "LARVAE",
      "field": "Corn Field #42 • Sector C",
      "time": "10:42 AM",
      "date": DateTime(2024, 10, 24)
    },
    {
      "name": "Fall Armyworm",
      "stage": "LARVAE",
      "field": "Corn Field #42 • Sector C",
      "time": "10:42 AM",
      "date": DateTime(2024, 10, 24)
    },
    {
      "name": "Fall Armyworm",
      "stage": "LARVAE",
      "field": "Corn Field #42 • Sector C",
      "time": "10:42 AM",
      "date": DateTime(2024, 10, 24)
    },
    {
      "name": "Fall Armyworm",
      "stage": "LARVAE",
      "field": "Corn Field #42 • Sector C",
      "time": "04:30 PM",
      "date": DateTime(2024, 8, 15)
    },
  ];

  List<Map<String, dynamic>> _filteredDetections = [];

  @override
  void initState() {
    super.initState();
    _filteredDetections = _allDetections;
  }

  void _applyFilters() {
    String keyword = _searchController.text.toLowerCase();
    setState(() {
      _filteredDetections = _allDetections.where((detection) {
        bool matchesSearch = detection["name"]!.toLowerCase().contains(keyword) ||
            detection["field"]!.toLowerCase().contains(keyword);
        bool matchesDate = true;
        if (_selectedDate != null) {
          DateTime detDate = detection["date"] as DateTime;
          matchesDate = detDate.year == _selectedDate!.year &&
              detDate.month == _selectedDate!.month &&
              detDate.day == _selectedDate!.day;
        }
        return matchesSearch && matchesDate;
      }).toList();
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF8DBA60),
              onPrimary: Color(0xFF102216),
              surface: Color(0xFF1C2C22),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _applyFilters();
    }
  }

  String _formatDateHeader(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return "TODAY, ${DateFormat('MMM d').format(date).toUpperCase()}";
    }
    return DateFormat('MMM d, yyyy').format(date).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    const Color bgDark = Color(0xFF102216);
    const Color primaryGreen = Color(0xFF8DBA60);
    const Color greyText = Color(0xFF737673);
    const Color white = Color(0xFFFFFFFF);
    const Color cardBg = Color(0xFF1C2C22);
    const Color accentGold = Color(0xFFCEA265);
    const Color accuracyGreen = Color(0xFF13EC5B);

    return Scaffold(
      backgroundColor: bgDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Detection History", style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 22)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => _applyFilters(),
              style: const TextStyle(color: white),
              decoration: InputDecoration(
                hintText: "Search fields, crops, or pests...",
                hintStyle: const TextStyle(color: greyText),
                prefixIcon: const Icon(Icons.search, color: greyText),
                filled: true,
                fillColor: Colors.white.withOpacity(0.05),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                ActionChip(
                  backgroundColor: _selectedDate == null ? primaryGreen : accentGold,
                  avatar: Icon(_selectedDate == null ? Icons.tune : Icons.calendar_today, size: 18, color: bgDark),
                  label: Text(
                    _selectedDate == null ? "All dates" : DateFormat('MMM d, yyyy').format(_selectedDate!),
                    style: const TextStyle(color: bgDark, fontWeight: FontWeight.bold)
                  ),
                  onPressed: () => _selectDate(context),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                if (_selectedDate != null)
                  IconButton(
                    icon: const Icon(Icons.close, color: white, size: 20),
                    onPressed: () {
                      setState(() => _selectedDate = null);
                      _applyFilters();
                    },
                  )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Divider(color: greyText, thickness: 0.5),
          ),
          Expanded(
            child: _filteredDetections.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    itemCount: _filteredDetections.length,
                    itemBuilder: (context, index) {
                      final item = _filteredDetections[index];
                      final DateTime date = item['date'];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index == 0 || (item['date'] as DateTime).day != (_filteredDetections[index - 1]['date'] as DateTime).day)
                            _buildSectionHeader(_formatDateHeader(date), greyText),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DetectionResult(data: item)),
                              );
                            },
                            child: _buildDetectionCard(item['name'], item['stage'], item['field'], item['time'], cardBg, accuracyGreen, white, greyText, accentGold),
                          ),
                        ],
                      );
                    },
                  )
                : const Center(child: Text("No detections found", style: TextStyle(color: greyText))),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 10),
      child: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
    );
  }

  Widget _buildDetectionCard(String name, String stage, String field, String time, Color cardBg, Color accuracyColor, Color white, Color grey, Color accentGold) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: grey.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 90, height: 90, color: Colors.grey[800],
              child: Image.asset('assets/images/faw.png', fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.bug_report, color: Colors.white24, size: 40)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text(stage, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(field, style: TextStyle(color: grey, fontSize: 12)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: accentGold),
                    const SizedBox(width: 4),
                    Text(time, style: TextStyle(color: accentGold, fontSize: 12)),
                    const SizedBox(width: 10),
                    Icon(Icons.location_on_outlined, size: 14, color: accentGold),
                    const SizedBox(width: 4),
                    Text("Geotagged", style: TextStyle(color: accentGold, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Text("96.6% Accuracy Rate", style: TextStyle(color: accuracyColor, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }
}