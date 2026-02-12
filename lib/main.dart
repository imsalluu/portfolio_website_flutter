import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/theme.dart';
import 'core/constants.dart';
import 'core/providers.dart';
import 'core/navigation.dart';
import 'widgets/navbar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/education_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/services_section.dart';
import 'sections/reviews_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer.dart';
import 'screens/project_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: PortfolioApp()));
}

class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final selectedProject = ref.watch(selectedProjectProvider);

    return MaterialApp(
      title: 'Salman Hossain | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const MainLayout(key: ValueKey('main')),
    );
  }
}

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.read(navigationProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SelectionArea(
        child: Stack(
          children: [
            // Background Layer
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark ? AppColors.darkGradient : AppColors.lightGradient,
                ),
              ),
            ),

            // Animated Blobs
            _BackgroundBlob(
              color: AppColors.primary.withOpacity(isDark ? 0.15 : 0.08),
              size: 400,
              top: -100,
              left: -100,
              duration: 25.seconds,
            ),
            _BackgroundBlob(
              color: AppColors.secondary.withOpacity(isDark ? 0.15 : 0.06),
              size: 500,
              bottom: -150,
              right: -100,
              duration: 30.seconds,
            ),
            _BackgroundBlob(
              color: AppColors.accent.withOpacity(isDark ? 0.12 : 0.05),
              size: 300,
              top: 300,
              right: 100,
              duration: 20.seconds,
            ),

            // Main Content
            SingleChildScrollView(
              child: Column(
                children: [
                   const Navbar(),
                   HeroSection(key: nav.sectionKeys['Home']),
                   AboutSection(key: nav.sectionKeys['About']),
                   ExperienceSection(key: nav.sectionKeys['Experience']),
                   EducationSection(key: nav.sectionKeys['Education']),
                   SkillsSection(key: nav.sectionKeys['Skills']),
                   ServicesSection(key: nav.sectionKeys['Services']),
                   ProjectsSection(key: nav.sectionKeys['Projects']),
                   ReviewsSection(key: nav.sectionKeys['Reviews']),
                   ContactSection(key: nav.sectionKeys['Contact']),
                   const Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundBlob extends StatelessWidget {
  final Color color;
  final double size;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final Duration duration;

  const _BackgroundBlob({
    required this.color,
    required this.size,
    this.top,
    this.left,
    this.bottom,
    this.right,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: RepaintBoundary(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ).animate(onPlay: (controller) => controller.repeat(reverse: true))
       .move(duration: duration, begin: const Offset(-40, -40), end: const Offset(80, 80), curve: Curves.easeInOutSine)
       .scale(duration: duration, begin: const Offset(0.8, 0.8), end: const Offset(1.3, 1.3), curve: Curves.easeInOutSine)
    );
  }
}
