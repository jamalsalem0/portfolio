import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../data/project_data.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 50),
              _buildProjectsGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInDown(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.video_library_rounded,
                  color: Colors.blueAccent,
                  size: 32,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                "Featured Projects",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        FadeInDown(
          delay: const Duration(milliseconds: 200),
          child: Text(
            "Explore my recent work with live video demos.",
            style: GoogleFonts.poppins(
              fontSize: 16, // صغرت الخط سنة عشان يبقى أنيق
              color: Colors.grey[600],
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 850;

        double spacing = 40;

        double cardWidth = isDesktop
            ? (constraints.maxWidth - spacing) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: spacing,
          alignment: WrapAlignment.start,
          children: ProjectData.list.map((project) {
            return FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: ProjectCard(project: project, width: cardWidth),
            );
          }).toList(),
        );
      },
    );
  }
}
