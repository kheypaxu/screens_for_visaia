import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Helper to jump to the last page (Skip)
  void _skipToEnd() {
    _pageController.animateToPage(
      3, 
      duration: const Duration(milliseconds: 500), 
      curve: Curves.easeInOut
    );
  }

  // Helper to go to next page
  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        // DISABLE SWIPING HERE
        physics: const NeverScrollableScrollPhysics(),
        children: [
          // SCREEN 1
          _buildPage(
            context,
            progressIndex: 1,
            topNormalText: "Welcome ",
            topHighlightText: "New Farmer!",
            imageWidget: Image.asset('assets/images/onboarding1.png', fit: BoxFit.contain),
            bottomNormalText: "Welcome to the ",
            bottomHighlightText: "Future\nof Farming!",
            descriptionWidget: RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 14, 
                  height: 1.5, 
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0,
                ),
                children: [
                  TextSpan(text: "We're glad to have you, Farmer. Let's set up your digital field and start protecting your harvest with "),
                  TextSpan(text: "VISAIA.", style: TextStyle(color: Color(0xFF8DBA60))),
                ],
              ),
            ),
            buttonLabel: "Get Started",
            horizontalPadding: 27, 
            onPressed: () => _nextPage(),
          ),
          
          // SCREEN 2
          _buildPage(
            context,
            progressIndex: 2,
            topNormalText: "Total Field Awareness,\n",
            topHighlightText: "Right in Your Pocket.",
            imageWidget: Image.asset('assets/images/onboarding2.png', fit: BoxFit.contain),
            bottomNormalText: "Monitor ",
            bottomHighlightText: "Your Crops",
            descriptionWidget: RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 14, 
                  height: 1.50, 
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0,
                ),
                text: "Keep a close eye on your crops and farmland. Our system provides real-time updates on field conditions to give you total control over your farm's performance.",
              ),
            ),
            buttonLabel: "Next",
            horizontalPadding: 38, 
            titlePadding: 77,      
            showSkip: true,
            onPressed: () => _nextPage(),
            onSkipPressed: _skipToEnd,
          ),

          // SCREEN 3
          _buildPage(
            context,
            progressIndex: 3,
            topNormalText: "Smart Eyes for ",
            topHighlightText: "Every\nPest.",
            imageWidget: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: constraints.maxWidth * 0.60, 
                      top: constraints.maxHeight * 0.01,
                      width: 150,
                      height: 178,
                      child: Image.asset('assets/images/onboarding3.1.png', fit: BoxFit.contain),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.01,
                      top: constraints.maxHeight * 0.01,
                      width: 210,
                      height: 210,
                      child: Image.asset('assets/images/onboarding3.2.png', fit: BoxFit.contain),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.35,
                      top: constraints.maxHeight * 0.55,
                      width: 133,
                      height: 164,
                      child: Image.asset('assets/images/onboarding3.3.png', fit: BoxFit.contain),
                    ),
                  ],
                );
              },
            ),
            bottomNormalText: "Pest Detection and ",
            bottomHighlightText: "Identification",
            descriptionWidget: RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 14, 
                  height: 1.5, 
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0,
                ),
                text: "Stop the spread before it starts. Snap a photo of any insect to get an instant diagnosis and a targeted plan to save your crop.",
              ),
            ),
            buttonLabel: "Next",
            horizontalPadding: 27, 
            showSkip: true,
            onPressed: () => _nextPage(),
            onSkipPressed: _skipToEnd,
          ),

          // SCREEN 4
          _buildPage(
            context,
            progressIndex: 4,
            topNormalText: "One Community, ",
            topHighlightText: "Zero Infestations.",
            imageWidget: Image.asset('assets/images/onboarding4.png', fit: BoxFit.contain),
            bottomNormalText: "Ready to ",
            bottomHighlightText: "Grow?",
            descriptionWidget: RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 14, 
                  height: 1.5, 
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0,
                ),
                text: "Receive alerts about local infestations and community reports to stay one step ahead of the threat.",
              ),
            ),
            buttonLabel: "Finish",
            horizontalPadding: 27, 
            showSkip: false,
            onPressed: () {
              // Add navigation to your Home/Login screen here
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
    BuildContext context, {
    required int progressIndex,
    required String topNormalText,
    required String topHighlightText,
    required Widget imageWidget,
    required String bottomNormalText,
    required String bottomHighlightText,
    required Widget descriptionWidget,
    required String buttonLabel,
    required VoidCallback onPressed,
    VoidCallback? onSkipPressed,
    double horizontalPadding = 27,
    double? titlePadding,
    bool showSkip = false,
  }) {
    final size = MediaQuery.of(context).size;
    const double curveDepth = 100.0; 
    final double whiteAreaHeight = size.height * 0.58;

    return Stack(
      children: [
        // Background Gradient
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF142F1B), Color(0xFF050D07)],
            ),
          ),
        ),
        // Glow Effect
        Positioned(
          top: whiteAreaHeight - 120,
          left: -60, 
          child: Container(
            width: 172,
            height: 162,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF8DBA60),
                  blurRadius: 150,
                  spreadRadius: 20, 
                ),
              ],
            ),
          ),
        ),
        // Bottom Content Area
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Padding(
                padding: EdgeInsets.only(left: titlePadding ?? horizontalPadding, right: 20),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), height: 1.2),
                    children: [
                      TextSpan(text: bottomNormalText),
                      TextSpan(text: bottomHighlightText, style: const TextStyle(color: Color(0xFF8DBA60))),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: descriptionWidget,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFFFF),
                      foregroundColor: const Color(0xFF000000),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                    ),
                    child: Text(buttonLabel, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Center( 
                child: showSkip 
                  ? TextButton(
                      onPressed: onSkipPressed, 
                      child: const Text("Skip", style: TextStyle(color: Color(0xB3FFFFFF)))
                    )
                  : const SizedBox(height: 48),
              ),
            ],
          ),
        ),
        // White Top Section with Curve
        CustomPaint(
          painter: CurveShadowPainter(curveDepth: curveDepth),
          child: ClipPath(
            clipper: WhiteTopCurveClipper(curveDepth: curveDepth),
            child: Container(
              width: double.infinity,
              height: whiteAreaHeight,
              color: const Color(0xFFFFFFFF),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildProgressIndicator(progressIndex),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF000000), height: 1.2),
                          children: [
                            TextSpan(text: topNormalText),
                            TextSpan(text: topHighlightText, style: const TextStyle(color: Color(0xFF8DBA60))),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: imageWidget,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 5, width: 35,
        decoration: BoxDecoration(
          color: index < count ? const Color(0xFF8DC63F) : const Color(0x4D9E9E9E),
          borderRadius: BorderRadius.circular(10),
        ),
      )),
    );
  }
}

class WhiteTopCurveClipper extends CustomClipper<Path> {
  final double curveDepth;
  WhiteTopCurveClipper({required this.curveDepth});
  @override
  Path getClip(Size size) {
    Path path = Path();
    double startHeight = size.height - curveDepth;
    path.lineTo(0, startHeight);
    path.quadraticBezierTo(size.width / 2, size.height + (curveDepth * 0.8), size.width, startHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CurveShadowPainter extends CustomPainter {
  final double curveDepth;
  CurveShadowPainter({required this.curveDepth});
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    double startHeight = size.height - curveDepth;
    path.lineTo(0, startHeight);
    path.quadraticBezierTo(size.width / 2, size.height + (curveDepth * 0.8), size.width, startHeight);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawShadow(path, const Color(0x4D000000), 15.0, true);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}