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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),

          const SizedBox(height: 50),

          _buildProjectsGrid(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInDown(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.video_library_rounded,
                  color: Colors.deepPurple,
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
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 900;
        double cardWidth = isDesktop
            ? (constraints.maxWidth - 40) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: 40,
          runSpacing: 50,
          children: ProjectData.list.map((project) {
            return ProjectCard(project: project, width: cardWidth);
          }).toList(),
        );
      },
    );
  }
}
