import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpertSupportScreen extends StatelessWidget {
  const ExpertSupportScreen({super.key});

  // Theme Colors based on UI
  static const Color primaryDark = Color(0xFF173408);
  static const Color bgGrey = Color(0xFFF9FAF9);
  static const Color chatBgGrey = Color(0xFFF1F4F1);
  static const Color textMain = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/images/Agent.png'),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB9E38E),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Expert Support',
                  style: GoogleFonts.epilogue(
                    color: primaryDark,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'ONLINE • DR. ARIS',
                  style: GoogleFonts.manrope(
                    color: textSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'TODAY',
                      style: GoogleFonts.manrope(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: textSecondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildSupportBubble(
                  "Hello! I'm Dr. Aris. I see you've been monitoring your North Field wheat. How can I assist you with your crop data today?",
                  "09:41 AM",
                ),
                _buildUserBubble(
                  "Hi Aris, I'm noticing some yellow spotting on the lower leaves. I think it might be Wheat Rust.",
                  "09:43 AM",
                ),
                _buildUserImageBubble(
                  // Placeholder for your local asset path
                  'assets/images/Crop_Image.png', 
                  "Here is a photo of the affected area.",
                  "09:43 AM",
                ),
                _buildSupportBubble(
                  "Thank you for the high-resolution image. Reviewing the spotting pattern... It does appear to be early-stage Leaf Rust (Puccinia triticina). I recommend an immediate application of a localized fungicide.",
                  "09:45 AM",
                ),
                _buildUserBubble(
                  "Should I isolate the irrigation zone for that section to prevent spread?",
                  "09:46 AM",
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.more_horiz, color: Colors.grey, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'ARIS IS TYPING...',
                      style: GoogleFonts.manrope(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildSupportBubble(String text, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: chatBgGrey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              text,
              style: GoogleFonts.manrope(fontSize: 15, color: textMain, height: 1.4),
            ),
          ),
          const SizedBox(height: 4),
          Text(time, style: GoogleFonts.manrope(fontSize: 10, color: textSecondary)),
        ],
      ),
    );
  }

  Widget _buildUserBubble(String text, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: primaryDark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              text,
              style: GoogleFonts.manrope(fontSize: 15, color: Colors.white, height: 1.4),
            ),
          ),
          const SizedBox(height: 4),
          Text(time, style: GoogleFonts.manrope(fontSize: 10, color: textSecondary)),
        ],
      ),
    );
  }

  Widget _buildUserImageBubble(String imagePath, String text, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: primaryDark,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    imagePath, 
                    fit: BoxFit.cover, 
                    height: 180, 
                    width: double.infinity,
                    errorBuilder: (c, e, s) => Container(
                      height: 180, 
                      width: double.infinity,
                      color: Colors.grey[400], 
                      child: const Icon(Icons.broken_image, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    text,
                    style: GoogleFonts.manrope(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(time, style: GoogleFonts.manrope(fontSize: 10, color: textSecondary)),
        ],
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: chatBgGrey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const Icon(Icons.add_photo_alternate_outlined, color: textSecondary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Message support...',
                        hintStyle: GoogleFonts.manrope(color: textSecondary, fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: primaryDark,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.send, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}