import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../widgets/header_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double mouseX = 0;
  double mouseY = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            mouseX = event.position.dx / size.width;
            mouseY = event.position.dy / size.height;
          });
        },
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  children: [
                    _buildFluidBlob(
                      top: -100 + (_controller.value * 50) - (mouseY * 30),
                      left: -50 + (mouseX * 30),
                      color: const Color(0xFF4F46E5).withOpacity(0.15),
                      size: size.width * 0.7,
                    ),

                    _buildFluidBlob(
                      bottom: -100 + (_controller.value * 80) + (mouseY * 30),
                      right: -100 - (mouseX * 30),
                      color: const Color(0xFF9333EA).withOpacity(0.12),
                      size: size.width * 0.8,
                    ),

                    Positioned(
                      top:
                          size.height * 0.3 +
                          (math.sin(_controller.value * 2 * math.pi) * 50),
                      left:
                          size.width * 0.2 +
                          (math.cos(_controller.value * 2 * math.pi) * 30),
                      child: Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF06B6D4).withOpacity(0.08),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF06B6D4).withOpacity(0.1),
                              blurRadius: 100,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0),
              child: Container(color: Colors.transparent),
            ),

            Positioned.fill(
              child: Opacity(
                opacity: 0.03,
                child: CustomPaint(painter: GridPainter()),
              ),
            ),

            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderSection(),

                      const SizedBox(height: 50),

                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        child: const SkillsSection(),
                      ),

                      const SizedBox(height: 50),

                      FadeInUp(
                        delay: const Duration(milliseconds: 400),
                        child: const ProjectsSection(),
                      ),

                      const SizedBox(height: 50),

                      FadeInUp(
                        delay: const Duration(milliseconds: 600),
                        child: const ContactSection(),
                      ),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFluidBlob({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required Color color,
    required double size,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          gradient: RadialGradient(
            colors: [color, color.withOpacity(0)],
            stops: const [0.2, 1.0],
          ),
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 0.5;

    const double step = 60;

    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
