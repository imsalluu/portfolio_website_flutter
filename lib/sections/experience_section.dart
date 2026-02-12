import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/constants.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/glass_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      {
        "role": "Team Leader, DevOps & QA",
        "company": "Fire Ai",
        "period": "2026 - Present",
        "desc": "Leading cross-functional teams, managing CI/CD pipelines, and ensuring high-quality software delivery through rigorous testing and robust infrastructure.",
        "icon": Icons.leaderboard_rounded,
        "isCurrent": true,
      },
      {
        "role": "Flutter Developer",
        "company": "Fire Ai",
        "period": "2025 - 2026",
        "desc": "Developed high-performance cross-platform mobile applications, integrated complex APIs, and implemented pixel-perfect UI designs.",
        "icon": Icons.flutter_dash_rounded,
        "isCurrent": false,
      },
    ];

    return SectionWrapper(
      title: "My Journey",
      subtitle: "EXPERIENCE ROADMAP",
      child: Column(
        children: List.generate(experiences.length, (index) {
          final exp = experiences[index];
          final isLast = index == experiences.length - 1;
          
          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline Line and Dot
                _TimelineIndicator(
                  isFirst: index == 0,
                  isLast: isLast,
                  isCurrent: exp["isCurrent"] as bool,
                ),
                const SizedBox(width: AppSpacing.xl),
                // content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
                    child: GlassCard(
                      opacity: (exp["isCurrent"] as bool) ? 0.1 : 0.05,
                      border: (exp["isCurrent"] as bool) 
                        ? Border.all(color: AppColors.primary.withOpacity(0.3), width: 2)
                        : null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  exp["role"] as String,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  exp["period"] as String,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            exp["company"] as String,
                            style: TextStyle(
                              color: AppColors.primary.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            exp["desc"] as String,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: (index * 200).ms).slideX(begin: 0.1),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _TimelineIndicator extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isCurrent;

  const _TimelineIndicator({
    required this.isFirst,
    required this.isLast,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 2,
            color: isFirst ? Colors.transparent : AppColors.primary.withOpacity(0.2),
          ),
        ),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCurrent ? AppColors.primary : Colors.transparent,
            border: Border.all(
              color: AppColors.primary,
              width: 3,
            ),
            boxShadow: isCurrent ? [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.5),
                blurRadius: 10,
              )
            ] : null,
          ),
          child: isCurrent ? const Center(
            child: Icon(Icons.check, size: 14, color: Colors.white),
          ) : null,
        ),
        Expanded(
          child: Container(
            width: 2,
            color: isLast ? Colors.transparent : AppColors.primary.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
