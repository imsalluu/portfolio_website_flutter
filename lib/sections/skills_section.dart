import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/constants.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/glass_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Data Categories
    final frameworks = [
      {"name": "Flutter", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg"},
      {"name": "Firebase", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg"},
      {"name": "Riverpod", "image": "https://raw.githubusercontent.com/rrousselGit/riverpod/master/resources/icon.png"}, // Official
    ];

    final languages = [
      {"name": "Dart", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg"},
      {"name": "Kotlin", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kotlin/kotlin-original.svg"},
      {"name": "Swift", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/swift/swift-original.svg"},
      {"name": "SQL", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg"},
    ];

    final cloudDeployment = [
      {"name": "AWS", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/amazonwebservices/amazonwebservices-original-wordmark.svg"},
      {"name": "VPS (Ubuntu)", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-plain.svg"},
      {"name": "Docker", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg"},
      {"name": "Vercel", "image": "https://assets.vercel.com/image/upload/v1588805858/repositories/vercel/logo.png"},
      {"name": "App Store", "image": "https://upload.wikimedia.org/wikipedia/commons/6/67/App_Store_%28iOS%29.svg"},
      {"name": "Play Store", "image": "https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg"},
    ];

    final tools = [
      {"name": "Git", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg"},
      {"name": "GitHub", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg"},
      {"name": "VS Code", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg"},
      {"name": "Postman", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postman/postman-original.svg"},
      {"name": "Figma", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/figma/figma-original.svg"},
      {"name": "Android Studio", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/androidstudio/androidstudio-original.svg"},
      {"name": "Jest", "image": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jest/jest-plain.svg"},
    ];

    return SectionWrapper(
      title: "Technical Expertise",
      subtitle: "SKILLS & TECHNOLOGIES",
      child: Column(
        children: [
          _SkillCategory(title: "Frameworks & Mobile", skills: frameworks, isDark: isDark, delay: 0),
          const SizedBox(height: AppSpacing.xl),
          _SkillCategory(title: "Languages", skills: languages, isDark: isDark, delay: 200),
          const SizedBox(height: AppSpacing.xl),
          _SkillCategory(title: "Cloud & Deployment", skills: cloudDeployment, isDark: isDark, delay: 400),
          const SizedBox(height: AppSpacing.xl),
          _SkillCategory(title: "Tools & Platforms", skills: tools, isDark: isDark, delay: 600),
        ],
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final List<Map<String, String>> skills;
  final bool isDark;
  final int delay;

  const _SkillCategory({required this.title, required this.skills, required this.isDark, required this.delay});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569), // Slate-400/600
          ),
        ).animate().fadeIn(delay: delay.ms),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: List.generate(skills.length, (index) {
            return _SquareSkillCard(
              name: skills[index]["name"]!,
              image: skills[index]["image"]!,
              isDark: isDark,
            ).animate().fadeIn(delay: (delay + index * 50).ms).scale(duration: 400.ms, curve: Curves.easeOutBack);
          }),
        ),
      ],
    );
  }
}

class _SquareSkillCard extends StatefulWidget {
  final String name;
  final String image;
  final bool isDark;

  const _SquareSkillCard({required this.name, required this.image, required this.isDark});

  @override
  State<_SquareSkillCard> createState() => _SquareSkillCardState();
}

class _SquareSkillCardState extends State<_SquareSkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GlassCard(
        width: 110,
        height: 110,
        padding: const EdgeInsets.all(16),
        borderRadius: 16,
        color: widget.isDark ? const Color(0xFF0F172A) : Colors.white,
        opacity: isHovered ? (widget.isDark ? 0.3 : 0.8) : (widget.isDark ? 0.2 : 0.6),
        border: isHovered 
            ? Border.all(color: AppColors.primary.withOpacity(0.5), width: 1.5) 
            : Border.all(color: (widget.isDark ? Colors.white : Colors.black).withOpacity(0.05)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.image.endsWith('.svg'))
              SvgPicture.network(
                widget.image,
                width: 40,
                height: 40,
                placeholderBuilder: (_) => const SizedBox(width: 40, height: 40),
              )
            else
              Image.network(
                widget.image,
                width: 40,
                height: 40,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 40, color: Colors.grey),
              ),
            const SizedBox(height: 12),
            Text(
              widget.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: widget.isDark ? Colors.white : AppColors.textMainLight,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
