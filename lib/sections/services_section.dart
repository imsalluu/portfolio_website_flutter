import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/constants.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/glass_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {"title": "App Development", "desc": "End-to-end mobile app development for iOS and Android using Flutter & Dart. Scalable, secure, and high-performance.", "icon": FontAwesomeIcons.mobileScreenButton},
      {"title": "UI/UX to Code", "desc": "Turning your Figma/Adobe XD designs into pixel-perfect, responsive Flutter widgets with smooth animations.", "icon": FontAwesomeIcons.figma},
      {"title": "Backend Integration", "desc": "Connecting your apps with Firebase, Supabase, or custom REST APIs securely and efficiently.", "icon": FontAwesomeIcons.database},
      {"title": "App Optimization", "desc": "Improving app performance, fixing bugs, reducing size, and enhancing the overall user experience.", "icon": FontAwesomeIcons.gaugeHigh},
      {"title": "Admin Panels", "desc": "Custom web-based admin dashboards to manage your app data, users, and analytics in real-time.", "icon": Icons.admin_panel_settings},
      {"title": "Store Deployment", "desc": "Handling the entire process of publishing your app to Google Play Store and Apple App Store.", "icon": FontAwesomeIcons.rocket},
      {"title": "Consultation", "desc": "Strategic advice on app architecture, tech stack selection, and scalability for your startup.", "icon": FontAwesomeIcons.handshake},
      {"title": "Code Review", "desc": "Auditing your existing Flutter codebase for best practices, performance bottlenecks, and security.", "icon": FontAwesomeIcons.code},
    ];

    return SectionWrapper(
      title: "My Services",
      subtitle: "WHAT I CAN DO",
      child: Wrap(
        spacing: AppSpacing.lg,
        runSpacing: AppSpacing.lg,
        alignment: WrapAlignment.center,
        children: List.generate(services.length, (index) {
          final s = services[index];
          return _ServiceCard(
            title: s["title"] as String,
            desc: s["desc"] as String,
            icon: s["icon"] as IconData,
            delay: index * 100,
          );
        }),
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final String title;
  final String desc;
  final IconData icon;
  final int delay;

  const _ServiceCard({required this.title, required this.desc, required this.icon, required this.delay});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GlassCard(
        width: 350, // Fixed width for wrap consistency
        height: 280, // Allow sufficient height, content is scrollable if needed or clamped
        opacity: isHovered ? (isDark ? 0.08 : 0.05) : (isDark ? 0.04 : 0.02),
        border: isHovered ? Border.all(color: AppColors.primary.withOpacity(0.5), width: 2) : null,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: 400.ms,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isHovered ? AppColors.primary : AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                  boxShadow: isHovered ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                    )
                  ] : null,
                ),
                child: FaIcon(
                  widget.icon, 
                  size: 32, 
                  color: isHovered ? Colors.white : AppColors.primary,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w800, 
                  fontSize: 20, 
                  color: isDark ? Colors.white : AppColors.textMainLight,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Expanded( // Ensure description takes available space
                child: Text(
                  widget.desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isDark ? AppColors.textDimDark : AppColors.textDimLight, 
                    fontSize: 14, 
                    height: 1.5,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ).animate().fadeIn(delay: widget.delay.ms).slideY(begin: 0.1, end: 0),
    );
  }
}
