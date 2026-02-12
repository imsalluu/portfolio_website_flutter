import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/providers.dart';
import '../core/navigation.dart';
import '../core/constants.dart';
import 'glass_card.dart';

class Navbar extends ConsumerWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final nav = ref.read(navigationProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.md),
        borderRadius: 50,
        opacity: 0.1,
        child: Row(
          children: [
            Text(
              "SALMAN",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                color: AppColors.primary,
              ),
            ),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 900)
              ...nav.sectionKeys.keys.map((section) => _NavButton(
                title: section,
                onTap: () => nav.scrollToSection(section),
              )),
            const SizedBox(width: AppSpacing.md),
            // Theme Toggle
            IconButton(
              onPressed: () {
                ref.read(themeModeProvider.notifier).state = 
                  isDark ? ThemeMode.light : ThemeMode.dark;
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) => RotationTransition(
                  turns: anim,
                  child: FadeTransition(opacity: anim, child: child),
                ),
                child: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  key: ValueKey(isDark),
                ),
              ),
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavButton({required this.title, required this.onTap});

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: TextButton(
        onPressed: widget.onTap,
        style: TextButton.styleFrom(
          foregroundColor: isHovered ? AppColors.primary : (isDark ? Colors.white70 : Colors.black87),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 2,
                width: isHovered ? 20 : 0,
                color: AppColors.primary,
                margin: const EdgeInsets.only(top: 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
