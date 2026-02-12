import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/constants.dart';

class SectionWrapper extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget child;
  final double? maxWidth;

  const SectionWrapper({
    super.key,
    this.title,
    this.subtitle,
    required this.child,
    this.maxWidth = 1200,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth!),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.section),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (subtitle != null) ...[
                Text(
                  subtitle!.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    fontSize: 14,
                  ),
                ).animate().fadeIn().slideY(begin: 0.2, end: 0),
                const SizedBox(height: AppSpacing.sm),
              ],
              if (title != null) ...[
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                    color: isDark ? Colors.white : AppColors.textMainLight,
                  ),
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
                const SizedBox(height: AppSpacing.xxl * 1.5),
              ],
              child,
            ],
          ),
        ),
      ),
    );
  }
}
