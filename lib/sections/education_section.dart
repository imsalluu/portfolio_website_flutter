import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/constants.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/glass_card.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final education = [
      {
        "degree": "Diploma in Computer Science & Engineering",
        "institution": "Feni Polytechnic Institute",
        "period": "2022 - 2025",
        "desc": "Focused on software engineering, data structures, algorithms, and mobile application development.",
        "icon": Icons.school_rounded,
      },
      {
        "degree": "Higher Secondary Certificate",
        "institution": "Chhagalnaiya Government Pilot High School",
        "period": "2016 - 2021",
        "desc": "Achieved primary excellence in mathematics and physics.",
        "icon": Icons.history_edu_rounded,
      },
    ];

    return SectionWrapper(
      title: "Academic Path",
      subtitle: "EDUCATION",
      child: Column(
        children: List.generate(education.length, (index) {
          final edu = education[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
            child: GlassCard(
              opacity: 0.04,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(edu["icon"] as IconData, color: AppColors.primary, size: 28),
                  ),
                  const SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                edu["degree"] as String,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                edu["period"] as String,
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          edu["institution"] as String,
                          style: TextStyle(
                            color: AppColors.primary.withOpacity(0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          edu["desc"] as String,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: (index * 150).ms).slideX(begin: 0.1, end: 0),
          );
        }),
      ),
    );
  }
}
