import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants.dart';
import '../widgets/section_wrapper.dart';
import '../core/navigation.dart';
import '../core/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 700;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final nav = ref.read(navigationProvider);

    return SectionWrapper(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.accent,
                              shape: BoxShape.circle,
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                            .scale(duration: 1.seconds, begin: const Offset(1, 1), end: const Offset(1.5, 1.5))
                            .fadeOut(),
                          const SizedBox(width: 8),
                          Text(
                            "Available for Hire",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold, 
                              fontSize: 12
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      "Hi, I'm Salman Hossain",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: isMobile ? 40 : 80, // Increased size for impact like in image
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        color: isDark ? Colors.white : AppColors.textMainLight,
                      ),
                    ).animate().fadeIn(duration: 800.ms, delay: 200.ms).shimmer(duration: 2.seconds, color: AppColors.primary.withOpacity(0.3)).slideY(begin: 0.2, end: 0),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      "Flutter Developer | Mobile App Specialist",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 20 : 32,
                        color: AppColors.primary,
                      ),
                    ).animate().fadeIn(duration: 800.ms, delay: 400.ms).slideY(begin: 0.2, end: 0),
                    const SizedBox(height: AppSpacing.xl),
                    Text(
                      "I craft high-performance, beautiful mobile applications that provide seamless user experiences across iOS and Android. Specialized in building scalable, real-world solutions.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isDark ? AppColors.textDimDark : AppColors.textDimLight,
                        height: 1.6,
                        fontSize: 18,
                      ),
                      textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    ).animate().fadeIn(duration: 800.ms, delay: 600.ms).slideY(begin: 0.2, end: 0),
                    const SizedBox(height: AppSpacing.xxl),
                    Wrap(
                      spacing: AppSpacing.md,
                      runSpacing: AppSpacing.md,
                      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                      children: [
                        _CTAButton(
                          text: "Hire Me",
                          isPrimary: true,
                          onPressed: () => nav.scrollToSection('Contact'),
                        ),
                        _CTAButton(
                          text: "Let's Talk",
                          isPrimary: false,
                          onPressed: () => nav.scrollToSection('Contact'),
                        ),
                      ],
                    ).animate().fadeIn(duration: 800.ms, delay: 800.ms).slideY(begin: 0.2, end: 0),
                    const SizedBox(height: AppSpacing.xl),
                    _HeroSocialLinks(isDark: isDark).animate().fadeIn(duration: 800.ms, delay: 1000.ms),
                  ],
                ),
              ),
              if (!isMobile) ...[
                const SizedBox(width: AppSpacing.xxl),
                Expanded(
                  flex: 2,
                  child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Back Decorative Layer (Rotated Glass)
                          Transform.rotate(
                            angle: -0.1,
                            child: Container(
                              width: 360,
                              height: 420,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.primary.withOpacity(0.2),
                                    AppColors.secondary.withOpacity(0.1),
                                  ],
                                ),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.1),
                                  width: 1,
                                ),
                              ),
                            ),
                          ).animate(onPlay: (c) => c.repeat(reverse: true))
                           .moveY(begin: 0, end: -10, duration: 4.seconds, curve: Curves.easeInOut),

                          // Main Image Layer
                          Container(
                            width: 380,
                            height: 440,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: isDark ? const Color(0xFF1E293B) : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.15),
                                  blurRadius: 40,
                                  offset: const Offset(0, 20),
                                ),
                              ],
                              border: Border.all(
                                color: isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.05),
                                width: 1,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  // The Image
                                  Image.asset(
                                    "assets/images/profile.png",
                                    fit: BoxFit.cover,
                                  ),
                                  // Inner Gradient Overlay (Subtle)
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.2),
                                        ],
                                        stops: const [0.8, 1.0],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).animate(onPlay: (c) => c.repeat(reverse: true))
                           .moveY(begin: 0, end: -15, duration: 3.seconds, curve: Curves.easeInOut),
                        ],
                      ),
                  ).animate().fadeIn(delay: 400.ms).scale(duration: 1000.ms),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}


Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch \$url');
  }
}

class _HeroSocialLinks extends StatelessWidget {
  final bool isDark;
  const _HeroSocialLinks({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialIcon(
          icon: FontAwesomeIcons.github, 
          isDark: isDark,
          onTap: () => _launchUrl("https://github.com/imsalluu"),
        ),
        _SocialIcon(
          icon: FontAwesomeIcons.linkedin, 
          isDark: isDark,
          onTap: () => _launchUrl("https://www.linkedin.com/in/im-salluu/"),
        ),
        _SocialIcon(
          icon: FontAwesomeIcons.instagram, 
          isDark: isDark,
          onTap: () => _launchUrl("https://www.instagram.com/im_salluuu"),
        ),
        _SocialIcon(
          icon: FontAwesomeIcons.facebook, 
          isDark: isDark,
          onTap: () => _launchUrl("https://www.facebook.com/imsalluuu"),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final bool isDark;
  final VoidCallback onTap;

  const _SocialIcon({
    required this.icon, 
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: IconButton(
        icon: FaIcon(
          icon, 
          size: 20, 
          color: isDark ? AppColors.textDimDark : AppColors.textDimLight
        ),
        onPressed: onTap,
        hoverColor: AppColors.primary.withOpacity(0.1),
      ),
    );
  }
}

class _CTAButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onPressed;

  const _CTAButton({
    required this.text,
    required this.isPrimary,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: isPrimary ? [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ] : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.primary : Colors.transparent,
          foregroundColor: isPrimary ? Colors.white : AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isPrimary ? BorderSide.none : const BorderSide(color: AppColors.primary, width: 2),
          ),
          elevation: 0,
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
