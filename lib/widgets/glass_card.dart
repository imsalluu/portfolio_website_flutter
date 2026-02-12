import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final double opacity;
  final EdgeInsetsGeometry? padding;
  final Border? border;
  final double? width;
  final double? height;
  final Color? color;

  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 24.0,
    this.blur = 12.0,
    this.opacity = 0.05,
    this.padding,
    this.border,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: width,
          height: height,
          padding: padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: color?.withAlpha((opacity * 255).toInt()) ?? 
                   (color != null ? color : null), 
            gradient: color == null ? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                (isDark ? Colors.white : Colors.black).withOpacity(opacity + 0.05),
                (isDark ? Colors.white : Colors.black).withOpacity(opacity),
              ],
            ) : null,
            borderRadius: BorderRadius.circular(borderRadius),
            border: border ?? Border.all(
              color: (isDark ? Colors.white : Colors.black).withOpacity(0.1),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? Colors.black : Colors.blueGrey).withOpacity(0.05),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
