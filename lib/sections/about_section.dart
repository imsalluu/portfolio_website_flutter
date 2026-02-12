import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/constants.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/glass_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SectionWrapper(
      title: "About Me",
      subtitle: "WHO AM I?",
      child: isMobile 
        ? Column(children: _buildContent(context, isDark))
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _buildImage(isDark)),
              const SizedBox(width: AppSpacing.xxl * 2),
              Expanded(flex: 2, child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildContent(context, isDark),
              )),
            ],
          ),
    );
  }

  Widget _buildImage(bool isDark) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: Container(
        height: 480, // Reduced height on mobile to prevent scrolling fatigue/overflow
        constraints: const BoxConstraints(maxHeight: 500),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24),
          image: const DecorationImage(
            image: AssetImage("assets/images/profile.png"),
            fit: BoxFit.cover,
            opacity: 0.9, // Increased opacity for visibility
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppColors.primary.withOpacity(0.4),
                Colors.transparent,
              ],
            ),
          ),
          // child: const Center(
          //   child: Icon(Icons.code_rounded, size: 80, color: Colors.white),
          // ),
        ),
      ),
    ).animate(onPlay: (c) => c.repeat(reverse: true))
     .scale(duration: 3.seconds, begin: const Offset(1, 1), end: const Offset(1.02, 1.02), curve: Curves.easeInOutSine);
  }

  List<Widget> _buildContent(BuildContext context, bool isDark) {
    return [
      Text(
        "Passionate Flutter Developer based in Bangladesh",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.primary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ).animate().fadeIn(duration: 800.ms).slideX(begin: 0.1, end: 0),
      const SizedBox(height: AppSpacing.lg),
      Text(
        "I am a results-oriented Mobile App Developer with a deep love for creating elegant, functional, and user-centric applications. With expertise in Flutter and Dart, I transform complex ideas into high-quality mobile experiences.",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: isDark ? AppColors.textMainDark : AppColors.textMainLight,
        ),
      ).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideX(begin: 0.1, end: 0),
      const SizedBox(height: AppSpacing.md),
      Text(
        "My journey started with a curiosity for how apps work, which evolved into a professional career building robust solutions for clients worldwide. I believe in clean code, scalable architecture, and constant learning.",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: isDark ? AppColors.textMainDark : AppColors.textMainLight,
        ),
      ).animate().fadeIn(duration: 800.ms, delay: 400.ms).slideX(begin: 0.1, end: 0),
      const SizedBox(height: AppSpacing.xl),
      _buildKeyStrengths(isDark).animate().fadeIn(duration: 800.ms, delay: 600.ms).slideY(begin: 0.1, end: 0),
    ];
  }

  Widget _buildKeyStrengths(bool isDark) {
    final strengths = [
      "User-Centric Design",
      "Robust Architecture",
      "Scalable Solutions",
      "Performance Optimization"
    ];

    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: strengths.map((s) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_rounded, size: 18, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              s, 
              style: TextStyle(
                color: isDark ? Colors.white : AppColors.textMainLight, 
                fontWeight: FontWeight.bold,
                fontSize: 14,
              )
            ),
          ],
        ),
      )).toList(),
    );
  }
}
