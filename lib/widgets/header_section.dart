import 'dart:html' as html; 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 900;
        double screenWidth = constraints.maxWidth;

        return Stack(
          children: [
            Positioned(
              right: isMobile ? -150 : -100,
              top: isMobile ? -150 : -100,
              child: FadeIn(
                duration: const Duration(seconds: 2),
                child: Container(
                  width: isMobile ? 500 : 800, 
                  height: isMobile ? 500 : 800,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.blueAccent.withOpacity(0.08),
                        Colors.purpleAccent.withOpacity(0.03),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 40 : 60, 
                horizontal: isMobile ? 20 : 40
              ),
              child: isMobile
                  ? _buildMobileLayout(screenWidth)
                  : _buildDesktopLayout(),
            ),
          ],
        );
      },
    );
  }


  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: _buildTextContent(alignment: CrossAxisAlignment.start, isMobile: false),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Center(child: _buildProfileWithOrbit(size: 400)),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(double screenWidth) {
    double orbitSize = screenWidth * 0.85;
    if (orbitSize > 320) orbitSize = 320;

    return Column(
      children: [
        const SizedBox(height: 20),
        _buildProfileWithOrbit(size: orbitSize),
        const SizedBox(height: 40),
        _buildTextContent(alignment: CrossAxisAlignment.center, isMobile: true),
      ],
    );
  }


  Widget _buildTextContent({required CrossAxisAlignment alignment, required bool isMobile}) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        FadeInDown(
          delay: const Duration(milliseconds: 200),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Pulse(
                  infinite: true,
                  child: const Icon(Icons.circle, size: 10, color: Colors.green),
                ),
                const SizedBox(width: 8),
                Text(
                  isMobile ? "Available for Work" : "Available for Freelance and Full-time Jobs",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 12 : 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: alignment == CrossAxisAlignment.center 
              ? WrapAlignment.center 
              : WrapAlignment.start,
          children: [
            Text(
              "Hi, I'm Jamal Salem ",
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 32 : 45,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A2E),
                height: 1.1,
              ),
            ),
            FadeInUp(
              child: SizedBox(
                height: isMobile ? 60 : 80, 
                width: isMobile ? 60 : 80,
                child: Lottie.network(
                  "https://assets10.lottiefiles.com/packages/lf20_jbrw3hcz.json",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: isMobile ? 40 : 50,
          child: DefaultTextStyle(
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 24 : 30, 
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  ' Flutter Developer',
                  speed: const Duration(milliseconds: 100),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Bio
        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: SizedBox(
            width: isMobile ? double.infinity : 500, 
            child: Text(
              "Junior Flutter Developer with a strong focus on building high-quality, scalable mobile applications.I specialize in writing clean, maintainable code using CleanArchitecture, applying solid design patterns, and implementing efficient state management solutions.Experienced in developing professional UI/UX, creating smooth animations, and integrating Firebase and RESTful APIs.Passionate about problem solving, performance optimization, and delivering reliable, production-ready apps.",
           

              style: GoogleFonts.poppins(
                fontSize: isMobile ? 14 : 16, 
                color: Colors.grey[600],
                height: 1.6,
              ),
              textAlign: alignment == CrossAxisAlignment.center
                  ? TextAlign.center
                  : TextAlign.start,
              maxLines: isMobile ? 4 : 10,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(height: 30),

        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: alignment == CrossAxisAlignment.center
                ? WrapAlignment.center
                : WrapAlignment.start,
            children: [
              _buildSocialBtn(
                FontAwesomeIcons.github,
                "https://github.com/jamalsalem0",
                Colors.black,
              ),
              _buildSocialBtn(
                FontAwesomeIcons.linkedin,
                "https://www.linkedin.com/in/jamalsalem/",
                const Color(0xFF0077B5),
              ),
              _buildSocialBtn(
                FontAwesomeIcons.facebook,
                "https://www.facebook.com/gamal.abdelnasser.56",
                const Color(0xFF1877F2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),

        FadeInUp(
          delay: const Duration(milliseconds: 1000),
          child: Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: alignment == CrossAxisAlignment.center
                ? WrapAlignment.center
                : WrapAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1A1A2E), Color(0xFF4B4B85)],
                  ),
                  borderRadius: BorderRadius.circular(30), // Circular matches the design
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1A1A2E).withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: _launchWhatsApp,
                  icon: const Icon(FontAwesomeIcons.whatsapp, size: 20, color: Colors.white),
                  label: const Text("Contact Me", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),

              OutlinedButton.icon(
                onPressed: _downloadCV,
                icon: const Icon(Icons.download_rounded, size: 20),
                label: Text(
                  "Download CV",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  side: const BorderSide(color: Colors.blueAccent, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  overlayColor: Colors.blueAccent.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildProfileWithOrbit({required double size}) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Orbit 1
          Spin(
            infinite: true,
            duration: const Duration(seconds: 20),
            child: Container(
              width: size * 0.9,
              height: size * 0.9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blueAccent.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: _buildFloatingIcon(Icons.storage, Colors.orange, size),
              ),
            ),
          ),

          Spin(
            infinite: true,
            duration: const Duration(seconds: 15),
            child: Container(
              width: size * 0.65,
              height: size * 0.65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.purpleAccent.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: _buildFloatingIcon(Icons.code, Colors.purple, size),
              ),
            ),
          ),

          Spin(
            infinite: true,
            duration: const Duration(seconds: 10),
            child: Container(
              width: size * 0.45,
              height: size * 0.45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: _buildFloatingIcon(Icons.flutter_dash, Colors.blueAccent, size),
              ),
            ),
          ),

          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size * 0.38,
                height: size * 0.38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.4),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),
              Container(
                width: size * 0.50,
                height: size * 0.50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/me.png'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildFloatingIcon(IconData icon, Color color, double parentSize) {
    double iconSize = parentSize < 300 ? 16 : 20;
    
    return Spin(
      infinite: true,
      duration: const Duration(seconds: 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(icon, color: color, size: iconSize),
      ),
    );
  }

  Widget _buildSocialBtn(IconData icon, String url, Color color) {
    return InkWell(
      onTap: () async => await launchUrl(Uri.parse(url)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: FaIcon(icon, size: 22, color: color),
      ),
    );
  }


  void _launchWhatsApp() async {
    String phoneNumber = "201229751200";
    String message = "Hello Jamal, I'd like to discuss a project.";
    final url = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}",
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void _downloadCV() {
    final String googleDriveUrl =
        "https://drive.google.com/file/d/1-RWcIP6gYm2Tas8zcm94yIYQEHJFB76_/view?usp=drive_link";
        
    html.AnchorElement anchorElement = html.AnchorElement(href: googleDriveUrl);
    anchorElement.download = "Jamal_Salem_CV.pdf";
    anchorElement.target = "_blank";
    anchorElement.click();
  }
}