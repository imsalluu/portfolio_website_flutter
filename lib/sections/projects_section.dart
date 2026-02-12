import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/providers.dart';
import '../core/constants.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/glass_card.dart';
import '../screens/project_details_screen.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        "title": "Social Media App",
        "desc": "Feature-rich social networking platform with real-time feed, stories, and chat functionality.",
        "tech": "Flutter, Firebase, Cloud Functions",
        "img": "https://images.unsplash.com/photo-1611162617474-5b21e879e113?q=80&w=400&auto=format&fit=crop",
      },
      {
        "title": "Loyalty App",
        "desc": "Customer retention platform with point tracking, rewards redemption, and QR code scanning.",
        "tech": "Flutter, Node.js, GraphQL",
        "img": "https://images.unsplash.com/photo-1628102491629-778571d893a3?q=80&w=400&auto=format&fit=crop",
      },
      {
        "title": "Dream Interpretation",
        "desc": "AI-powered journal that analyzes dreams and provides psychological insights using NLP.",
        "tech": "Flutter, OpenAI API, SQLite",
        "img": "https://images.unsplash.com/photo-1517960413843-0aee8e2b3285?q=80&w=400&auto=format&fit=crop",
      },
      {
        "title": "Meeting Scheduler",
        "desc": "Productivity tool for optimizing team schedules with calendar sync and automated reminders.",
        "tech": "Flutter, Google Calendar API, Provider",
        "img": "https://images.unsplash.com/photo-1506784983877-45594efa4cbe?q=80&w=400&auto=format&fit=crop",
      },
      {
        "title": "Farm Management",
        "desc": "Complete IoT solution for monitoring and managing farm livestock and crops.",
        "tech": "Flutter, Firebase, IoT",
        "img": "https://images.unsplash.com/photo-1595113316349-9fa4ee24f884?q=80&w=400&auto=format&fit=crop",
      },
      {
        "title": "POS System",
        "desc": "Multi-platform retail management system with real-time inventory and sales tracking.",
        "tech": "Flutter, Node.js, MongoDB",
        "img": "https://images.unsplash.com/photo-1556742044-3c52d6e88c62?q=80&w=400&auto=format&fit=crop",
      },
    ];

    return SectionWrapper(
      title: "My Projects",
      subtitle: "SELECTED WORK",
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 380,
          mainAxisSpacing: AppSpacing.xl,
          crossAxisSpacing: AppSpacing.xl,
          childAspectRatio: 0.8,
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final p = projects[index];
          return _ProjectCard(
            title: p["title"]!,
            description: p["desc"]!,
            techStack: p["tech"]!,
            imageUrl: p["img"]!,
          ).animate().fadeIn(delay: (index * 150).ms).slideY(begin: 0.2, end: 0);
        },
      ),
    );
  }
}

class _ProjectCard extends ConsumerStatefulWidget {
  final String title;
  final String description;
  final String techStack;
  final String imageUrl;

  const _ProjectCard({
    required this.title, 
    required this.description, 
    required this.techStack,
    required this.imageUrl,
  });

  @override
  ConsumerState<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends ConsumerState<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailsScreen(
                project: {
                  'title': widget.title,
                  'desc': widget.description,
                  'tech': widget.techStack,
                  'img': widget.imageUrl,
                },
              ),
            ),
          );
        },
        child: AnimatedScale(
        scale: isHovered ? 1.03 : 1.0,
        duration: 300.ms,
        curve: Curves.easeOut,
        child: GlassCard(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    image: DecorationImage(
                      image: NetworkImage(widget.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: AnimatedContainer(
                    duration: 300.ms,
                    color: isHovered ? Colors.black.withOpacity(0.2) : Colors.black.withOpacity(0.5),
                    child: Center(
                      child: AnimatedOpacity(
                        duration: 300.ms,
                        opacity: isHovered ? 1.0 : 0.0,
                        child: const Icon(FontAwesomeIcons.arrowUpRightFromSquare, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      widget.description,
                      style: TextStyle(color: AppColors.textDimDark, fontSize: 13, height: 1.5),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Wrap(
                      spacing: 8,
                      children: widget.techStack.split(', ').map((t) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                        ),
                        child: Text(t, style: const TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold)),
                      )).toList(),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      children: [
                        _SmallButton(icon: FontAwesomeIcons.globe, label: "Live", onTap: () {}),
                        const SizedBox(width: AppSpacing.md),
                        _SmallButton(icon: FontAwesomeIcons.github, label: "Repo", onTap: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}

class _SmallButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SmallButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            FaIcon(icon, size: 12, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
