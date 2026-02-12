import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/providers.dart';
import '../core/constants.dart';
import '../widgets/glass_card.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Map<String, String> project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: isDark ? const Color(0xFF0F172A) : Colors.white,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    project['img']!,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          isDark ? const Color(0xFF0F172A) : Colors.white,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Tags
                  Text(
                    project['title']!,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: isDark ? Colors.white : AppColors.textMainLight,
                      letterSpacing: -0.5,
                      height: 1.1,
                    ),
                  ).animate().fadeIn().slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: (project['tech']!).split(', ').map((t) => 
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                        ),
                        child: Text(
                          t, 
                          style: const TextStyle(
                            color: AppColors.primary, 
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ).toList(),
                  ).animate().fadeIn(delay: 200.ms),
                  
                  const SizedBox(height: 40),

                  // Main Content Layout
                  if (isMobile)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDescription(isDark),
                        const SizedBox(height: 32),
                        _buildFeatures(isDark),
                        const SizedBox(height: 32),
                        _buildSidebar(isDark),
                      ],
                    )
                  else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildDescription(isDark),
                              const SizedBox(height: 40),
                              _buildFeatures(isDark),
                            ],
                          ),
                        ),
                        const SizedBox(width: 60),
                        Expanded(
                          flex: 1,
                          child: _buildSidebar(isDark),
                        ),
                      ],
                    ),
                    
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Project Overview",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : AppColors.textMainLight,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          project['desc']!,
          style: TextStyle(
            fontSize: 17,
            height: 1.7,
            color: isDark ? AppColors.textDimDark : AppColors.textDimLight,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatures(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Key Features",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : AppColors.textMainLight,
          ),
        ),
        const SizedBox(height: 20),
        _FeatureList(isDark: isDark),
      ],
    );
  }

  Widget _buildSidebar(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Project Status", 
                style: TextStyle(
                  color: isDark ? Colors.grey : Colors.grey[600], 
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.check_circle_rounded, color: Colors.green, size: 20),
                  SizedBox(width: 8),
                  Text("Completed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 24),
              _LinkButton(
                label: "View Live Demo",
                icon: FontAwesomeIcons.globe,
                color: AppColors.primary,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _LinkButton(
                label: "Source Code",
                icon: FontAwesomeIcons.github,
                color: isDark ? Colors.white : Colors.black,
                outline: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeatureList extends StatelessWidget {
  final bool isDark;
  const _FeatureList({required this.isDark});

  @override
  Widget build(BuildContext context) {
    // Mock features for now, ideally passed from data
    final features = [
      "Responsive UI Design",
      "Real-time Data Sync",
      "Secure Authentication",
      "Cloud Integration",
    ];

    return Column(
      children: features.map((f) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            const Icon(Icons.bolt_rounded, color: AppColors.secondary, size: 20),
            const SizedBox(width: 12),
            Text(
              f,
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }
}

class _LinkButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool outline;
  final VoidCallback onTap;

  const _LinkButton({
    required this.label, 
    required this.icon, 
    required this.color, 
    this.outline = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: outline ? null : color,
          border: outline ? Border.all(color: color, width: 2) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, color: outline ? color : Colors.white, size: 18),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                color: outline ? color : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
