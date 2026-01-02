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
    return Stack(
      children: [
        Positioned(
          right: -100,
          top: -100,
          child: FadeIn(
            duration: const Duration(seconds: 2),
            child: Container(
              width: 800,
              height: 800,
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
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 900
                  ? _buildDesktopLayout()
                  : _buildMobileLayout();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: _buildTextContent(alignment: CrossAxisAlignment.start),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Center(child: _buildProfileWithOrbit(size: 400)),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildProfileWithOrbit(size: 280),
        const SizedBox(height: 50),
        _buildTextContent(alignment: CrossAxisAlignment.center),
      ],
    );
  }

  Widget _buildTextContent({required CrossAxisAlignment alignment}) {
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
                  child: const Icon(
                    Icons.circle,
                    size: 10,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "Available for Freelance and Full-time Jobs",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // الاسم + اليد
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: alignment == CrossAxisAlignment.center
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                "Hi, I'm Jamal Salem ",
                style: GoogleFonts.poppins(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A1A2E),
                  height: 1.1,
                ),
              ),
            ),
            FadeInUp(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Lottie.network(
                  "https://assets10.lottiefiles.com/packages/lf20_jbrw3hcz.json",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: 50,
          child: DefaultTextStyle(
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  ' Flutter Developer',
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: SizedBox(
            width: 500,
            child: Text(
              "Junior Flutter Developer with a strong focus on building high-quality, scalable mobile applications.I specialize in writing clean, maintainable code using CleanArchitecture, applying solid design patterns, and implementing efficient state management solutions.Experienced in developing professional UI/UX, creating smooth animations, and integrating Firebase and RESTful APIs.Passionate about problem solving, performance optimization, and delivering reliable, production-ready apps.",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.6,
              ),
              textAlign: alignment == CrossAxisAlignment.center
                  ? TextAlign.center
                  : TextAlign.start,
            ),
          ),
        ),
        const SizedBox(height: 30),

        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: Row(
            mainAxisAlignment: alignment == CrossAxisAlignment.center
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              _buildSocialBtn(
                FontAwesomeIcons.github,
                "https://github.com/jamalsalem0",
                Colors.black,
              ),
              const SizedBox(width: 15),
              _buildSocialBtn(
                FontAwesomeIcons.linkedin,
                "https://www.linkedin.com/in/jamalsalem/",
                const Color(0xFF0077B5),
              ),
              const SizedBox(width: 15),
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
          child: Row(
            mainAxisAlignment: alignment == CrossAxisAlignment.center
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1A1A2E), Color(0xFF4B4B85)],
                  ),
                  borderRadius: BorderRadius.circular(12),
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
                  icon: const Icon(
                    FontAwesomeIcons.whatsapp,
                    size: 20,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Contact Me",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 18,
                  ),
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
                child: _buildFloatingIcon(
                  Icons.storage,
                  Colors.orange,
                ), // Database
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
                child: _buildFloatingIcon(Icons.code, Colors.purple), // Code
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
                child: _buildFloatingIcon(
                  Icons.flutter_dash,
                  Colors.blueAccent,
                ), // Flutter
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

  Widget _buildFloatingIcon(IconData icon, Color color) {
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
        child: Icon(icon, color: color, size: 20),
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

  Future<void> _downloadCV() async {
    final String googleDriveUrl =
        "https://drive.google.com/file/d/1-RWcIP6gYm2Tas8zcm94yIYQEHJFB76_/view?usp=drive_link";

    final Uri uri = Uri.parse(googleDriveUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch CV url");
    }
  }
}
