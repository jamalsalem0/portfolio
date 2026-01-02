import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.flash_on_rounded,
                    color: Colors.blueAccent,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  "Technical Skills",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A2E),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          _buildSkillGroupCard(
            "📱 Mobile App Development",
            "Core Framework & Architecture",
            [
              SkillItem(
                "Flutter & Dart (OOP/Async)",
                FontAwesomeIcons.flutter,
                0.95,
                Colors.blueAccent,
              ),
              SkillItem(
                "Clean Architecture & MVVM",
                FontAwesomeIcons.layerGroup,
                0.90,
                Colors.purple,
              ),
              SkillItem(
                "Bloc & Cubit (Main Stack)",
                FontAwesomeIcons.cubes,
                0.92,
                Colors.redAccent,
              ),
              SkillItem(
                "Riverpod & Provider",
                FontAwesomeIcons.diagramProject,
                0.85,
                Colors.teal,
              ),
              SkillItem(
                "Advanced UI & Animations",
                FontAwesomeIcons.wandMagicSparkles,
                0.88,
                Colors.orangeAccent,
              ),
            ],
            delay: 0,
          ),

          const SizedBox(height: 30),

          _buildSkillGroupCard(
            "☁️ Backend & Networking",
            "API Integration, Database & Cloud",
            [
              SkillItem(
                "RESTful APIs (Dio/Retrofit)",
                FontAwesomeIcons.server,
                0.92,
                Colors.green,
              ),
              SkillItem(
                "GraphQL Integration",
                FontAwesomeIcons.circleNodes,
                0.80,
                const Color(0xFFE10098),
              ),
              SkillItem(
                "Google Maps & Payment APIs",
                FontAwesomeIcons.mapLocationDot,
                0.85,
                Colors.blueGrey,
              ),
              SkillItem(
                "Microsoft SQL Server",
                FontAwesomeIcons.database,
                0.80,
                const Color(0xFFA91D22),
              ),
              SkillItem(
                "Postman & Swagger",
                FontAwesomeIcons.paperPlane,
                0.88,
                const Color(0xFFFF6C37),
              ),
              SkillItem(
                "Firebase (Full Suite)",
                FontAwesomeIcons.fire,
                0.85,
                Colors.amber[800]!,
              ),
            ],
            delay: 200,
          ),

          const SizedBox(height: 30),

          _buildSkillGroupCard(
            "🛠️ Tools & DevOps",
            "Version Control & Workflow",
            [
              SkillItem(
                "Git, GitHub & GitLab",
                FontAwesomeIcons.github,
                0.92,
                Colors.black87,
              ),
              SkillItem(
                "CI/CD (Codemagic/Actions)",
                FontAwesomeIcons.infinity,
                0.70,
                Colors.blueGrey,
              ),
              SkillItem(
                "Unit & Widget Testing",
                FontAwesomeIcons.vial,
                0.75,
                Colors.green[700]!,
              ),
              SkillItem(
                "Figma to Flutter",
                FontAwesomeIcons.figma,
                0.85,
                Colors.pinkAccent,
              ),
            ],
            delay: 400,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillGroupCard(
    String title,
    String subtitle,
    List<SkillItem> skills, {
    required int delay,
  }) {
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(color: Colors.white, width: 2),
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
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            ...skills.map((skill) => _buildSkillRow(skill)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillRow(SkillItem skill) {
    String levelText;
    Color levelColor;
    if (skill.percentage >= 0.9) {
      levelText = "Expert";
      levelColor = Colors.green;
    } else if (skill.percentage >= 0.75) {
      levelText = "Advanced";
      levelColor = Colors.blue;
    } else {
      levelText = "Intermediate";
      levelColor = Colors.orange;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: skill.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FaIcon(skill.icon, size: 16, color: skill.color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  skill.name,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1A2E),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: levelColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  levelText,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: levelColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: skill.percentage),
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeOutQuart,
                    builder: (context, value, child) {
                      return Container(
                        height: 6,
                        width: constraints.maxWidth * value,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [skill.color.withOpacity(0.4), skill.color],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: skill.color.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class SkillItem {
  final String name;
  final IconData icon;
  final double percentage;
  final Color color;

  SkillItem(this.name, this.icon, this.percentage, this.color);
}
